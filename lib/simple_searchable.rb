require 'simple_searchable/version'

module SimpleSearchable
  module SearchableBy
    def searchable_by(*method_names)
      self.singleton_class.send(:define_method, :search) do |opts|
        return all if opts.nil?

        search_filter_all(method_names, opts)
      end

      self.send(:extend, FilterMethods)
    end

    module FilterMethods
      def search_filter(name, arg)
        arg.present? ? send(name, arg) : all
      end

      def search_filter_all(names, opts)
        result = self.all
        names.each do |n|
          unless opts[n].blank?
            opts[n].reject!(&:blank?) if opts[n].is_a?(Array)
            result = result.search_filter(n, opts[n])
          end
        end
        result
      end
    end
  end
end

ActiveRecord::Base.send(:extend, SimpleSearchable::SearchableBy)
