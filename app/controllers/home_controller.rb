class HomeController < ApplicationController
  def index
    owner, repo = params[:owner], params[:repo]
    @repository = Repository.find_by_full_name("#{owner}/#{repo}")
    if @repository.nil?
      render text: "Repository \"#{owner}/#{repo}\" can't find.", status: 404
      return
    end
    @language = params[:language] || extract_locale_from_accept_language_header || 'en'

    respond_to do |format|
      format.html
      format.json {
        contribs = @repository.contributors.limit(250).includes(owner: :location)
        people = contribs.map do |c|
          person = {
            contributions: c.contributions,
            name:          c.owner.name,
            login:         c.owner.login,
            avatar_url:    c.owner.avatar_url,
            blog:          c.owner.blog
          }
          if l = c.owner.location
            person.update(location: l.name, lat: l.lat, lng: l.lng)
           if c = l.city
             person.update(offset: ActiveSupport::TimeZone[c.timezone].utc_offset)
           end
          end
          person
        end
        # TODO lat/lng nilは抜く？
        render json: people.to_json
      }
    end
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].to_s.scan(/^[a-z]{2}/).first
  end
end
