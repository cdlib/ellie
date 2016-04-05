class SearchController < ApplicationController  
  ITEM_ID = Regexp.compile(/([a-z]|[0-9])+\.\$*([a-z]|[A-Z]|[0-9]|\/|\:|\$)+/)
  CLUSTER_ID = Regexp.compile(/(^cid\:)([0-9]*$)/)
  CLUSTER_SEARCH = Regexp.compile(/(^oclc\:)|(^lccn\:)|(^isbn\:)|(^issn\:)|(^cat\:)|(^htid\:)/)
  # New: Display search dialog or forward search request
  def new
    if id = params[:id]
      case
      when ITEM_ID.match(id)
        # with a item htid go direct to item page
        redirect_to item_path(params[:id].downcase)      
      when match = CLUSTER_ID.match(id)
        redirect_to cluster_path(match[2]) 
      else
        flash.now[:notice] = "Use a valid htid or use a prefix (e.g. oclc, lccn, isbn, issn, sysid)"
      end
    end
  end
end