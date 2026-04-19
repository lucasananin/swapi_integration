module PaginationHelper
  def pagination_window(current_page, total_pages, window = 2)
    start_page = [ current_page - window, 1 ].max
    end_page = [ current_page + window, total_pages ].min

    {
      start_page: start_page,
      end_page: end_page
    }
  end
end
