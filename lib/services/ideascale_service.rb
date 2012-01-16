class IdeascaleService < Service
  def self.handles?(uri)
    uri.host =~ /ideascale.com$/
  end
  
  def shortname
    :ideascale
  end
  
  def display_name
    "#{account} on IdeaScale"
  end
  
  def account
    /^(?<account>[\w-]+)\.ideascale.com/ =~ @uri.host
    account
  end

  def service_url_example
    "http://opengov.ideascale.com/"
  end
  
  def service_url_canonical
    "http://#{account}.ideascale.com/"
  end

  private
  
  def fetch_details
    {
      :account => account,
    }
  end
end

Service.register(:ideascale, IdeascaleService)
