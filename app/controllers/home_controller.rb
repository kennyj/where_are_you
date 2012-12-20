class HomeController < ApplicationController
  def index
    owner, repo = params[:owner], params[:repo]
    @repository = Repository.find_by_full_name("#{owner}/#{repo}")
    if @repository.nil?
      render text: "Repository \"#{owner}/#{repo}\" can't find.", status: 404
      return
    end
   
    respond_to do |format|
      format.html
      format.json {
        contribs = @repository.contributors.limit(300).includes(owner: :location)
        people = contribs.map do |c|
          person = {
            contributions: c.contributions,
            name:          c.owner.name,
            login:         c.owner.login,
            avatar_url:    c.owner.avatar_url
          }
          if l = c.owner.location
            person.update(location: l.name, lat: l.lat, lng: l.lng)
          end
          person
        end
        # TODO lat/lng nilは抜く？
        render json: people.to_json
      }
    end
  end
end
