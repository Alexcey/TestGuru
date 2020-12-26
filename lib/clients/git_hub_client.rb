class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = ENV['GITHUB_TOKEN'] #b0b333840c8300317a7fca5daa1d1b09394da3d2'

  def initialize
    @http_client = setup_http_client
  end

  def create_gists(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Countent-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end