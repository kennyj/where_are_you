class Repository < ActiveRecord::Base
  validates_presence_of :github_id, :name, :owner_id, :full_name
  # validates_presence_of :fork
  validates_uniqueness_of :github_id, :full_name
  belongs_to :owner
  has_many :contributors, -> { order("contributions desc") }

  def self.create_or_update_from_api(full_name, client = Github.client)
    remote = client.repo(full_name)

    repo = self.find_or_initialize_by(github_id: remote.id)
    repo.owner = Object.const_get(remote.owner.type).create_or_update_from_api(remote.owner.login, client)
    repo.github_id = remote.id
    repo.name      = remote.name
    repo.full_name = remote.full_name
    repo.description = remote.description
    repo.fork      = remote.fork
    repo.homepage  = remote.homepage
    repo.save!
    repo
  rescue Octokit::NotFound => e
    raise ActiveRecord::RecordNotFound.new(e)
  end

  def refresh_contributors_from_api(client = Github.client)
    self.class.transaction do
      Contributor.destroy_all(["repository_id = ?", self.id])
      client.contributors(self.full_name, false).each do |c|
        klazz = Object.const_get(c.type)
        owner = klazz.find_by_github_id(c.id) || klazz.create_or_update_from_api(c.login, client)
        model = Contributor.new(owner_id: owner.id,
                                 repository_id: self.id,
                                 contributions: c.contributions)
        model.save!
      end
    end
  end
end
