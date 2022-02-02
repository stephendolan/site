class Builders::RequireFeaturedWriting < SiteBuilder
  def build
    hook :site, :post_read do |site|
      featured_writing = site.collections["writing"].resources.select do |writing|
        writing.published? == true && writing.data["featured"] == true
      end

      if featured_writing.size != 1
        raise "Exactly one published featured writing is required"
      end
    end
  end
end
