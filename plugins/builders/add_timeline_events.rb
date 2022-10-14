class Builders::AddTimelineEvents < SiteBuilder
  Event = Struct.new(:id, :name, :description, :link, :date, :hidden, :image_path, :svg_path, keyword_init: true)

  def events
    events = [
      Event.new(description: "Graduated from", name: "Georgia Institute of Technology", date: Date.new(2015, 12, 12), link: "https://www.gatech.edu", svg_path: academic_cap_svg),
      Event.new(hidden: true, description: "Database Developer at", name: "MerchLogix", date: Date.new(2013, 2), link: "https://merchlogix.com", svg_path: database_svg),
      Event.new(hidden: true, description: "Account Engineer at", name: "MerchLogix", date: Date.new(2015, 12, 20), link: "https://merchlogix.com", svg_path: cog_svg),
      Event.new(hidden: true, description: "Cofounded", name: "Big Southern Software", date: Date.new(2018, 5), link: "https://bigsouthernsoftware.com", svg_path: code_svg),
      Event.new(description: "Director of Account Engineering at", name: "MerchLogix", date: Date.new(2019, 3), link: "https://merchlogix.com", svg_path: users_svg),
      Event.new(description: "Joined core team of", name: "Lucky Framework", date: Date.new(2020, 10, 13), link: "https://luckyframework.org", svg_path: code_svg),
      Event.new(description: "Founded", name: "LuckyCasts", date: Date.new(2020, 12), link: "https://luckycasts.com", svg_path: video_svg),
      Event.new(description: "Chief of Staff at", name: "Tuple", date: Date.new(2021, 8), link: "https://tuple.app", svg_path: clipboard_svg),
      Event.new(description: "Chief Operating Officer at", name: "Tuple", date: Date.new(2022, 10), link: "https://tuple.app", svg_path: business_svg)
    ]

    id = 1
    events.map do |event|
      event.id = id
      id += 1
    end

    events.reject(&:hidden)
  end

  def build
    events.each do |event|
      add_resource :timeline_events, event.id do
        description event.description
        name event.name
        link event.link
        date event.date
        svg_path event.svg_path
      end
    end
  end

  private

  def code_svg
    <<~SVG
      <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd" />
    SVG
  end

  def clipboard_svg
    <<~SVG
      <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
      <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm9.707 5.707a1 1 0 00-1.414-1.414L9 12.586l-1.293-1.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
    SVG
  end

  def academic_cap_svg
    <<~SVG
      <path d="M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838L7.667 9.088l1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z" />
    SVG
  end

  def business_svg
    <<~SVG
      <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 21h19.5m-18-18v18m10.5-18v18m6-13.5V21M6.75 6.75h.75m-.75 3h.75m-.75 3h.75m3-6h.75m-.75 3h.75m-.75 3h.75M6.75 21v-3.375c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21M3 3h12m-.75 4.5H21m-3.75 3.75h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008zm0 3h.008v.008h-.008v-.008z" />
    SVG
  end

  def video_svg
    <<~SVG
      <path d="M2 6a2 2 0 012-2h6a2 2 0 012 2v8a2 2 0 01-2 2H4a2 2 0 01-2-2V6zM14.553 7.106A1 1 0 0014 8v4a1 1 0 00.553.894l2 1A1 1 0 0018 13V7a1 1 0 00-1.447-.894l-2 1z" />
    SVG
  end

  def cog_svg
    <<~SVG
      <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd" />
    SVG
  end

  def users_svg
    <<~SVG
      <path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z" />
    SVG
  end

  def database_svg
    <<~SVG
      <path fill-rule="evenodd" d="M2 5a2 2 0 012-2h12a2 2 0 012 2v2a2 2 0 01-2 2H4a2 2 0 01-2-2V5zm14 1a1 1 0 11-2 0 1 1 0 012 0zM2 13a2 2 0 012-2h12a2 2 0 012 2v2a2 2 0 01-2 2H4a2 2 0 01-2-2v-2zm14 1a1 1 0 11-2 0 1 1 0 012 0z" clip-rule="evenodd" />
    SVG
  end
end
