class Owner < ActiveRecord::Base
  validates_presence_of   :login, :github_id, :type
  validates_uniqueness_of :login, :github_id

  belongs_to :location

  def self.create_or_update_from_api(login, client = Github.client)
    remote = client.user(login)

    repo = Object.const_get(remote.type).find_or_initialize_by(github_id: remote.id)
    repo.login     = remote.login
    repo.github_id = remote.id
    repo.avatar_url = remote.avatar_url
    repo.gravatar_id = remote.gravatar_id
    repo.type      = remote.type
    repo.name      = remote.name
    repo.company   = remote.company
    repo.blog      = remote.blog
    l = remote.location.to_s.downcase
    location = l.blank? ? nil : Location.find_or_create_by(name: l)
    repo.location  = location
    repo.email     = remote.email
    repo.hireable  = remote.hireable
    repo.bio       = remote.bio
    repo.save!
    repo
  rescue Octokit::NotFound => e
    raise ActiveRecord::RecordNotFound.new(e)
  end
end
