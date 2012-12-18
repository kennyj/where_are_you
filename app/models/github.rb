class Github < Settingslogic
  source "#{Rails.root}/config/github.yml"
  def self.client
    Octokit::Client.new login: Github.login,
                        password: Github.password
  end
end

