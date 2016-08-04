# SimpleSearchable

This gem adds the utility methods for a basic ActiveRecord search/filtering pattern explained [here](http://www.wordofmike.net/j/easy-active-record-search-pattern).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_searchable'
```

And then execute:

    $ bundle

## Usage

To use, bundle the gem with your project and call `searchable_by` from your model(s):

```ruby
class Religion < ActiveRecord::Base
  searchable_by :monotheiestic, :originated_in
  
  def self.originated_in(continents)
    where(originating_continent: continents)
  end
  
  def self.monotheistic(true_false)
    where(monotheistic: true_false)
  end
end
```

Now write a search form which uses the method names as parameter keys:

```erb
<%= form_tag religions_path do %>
  <%= fields_for :religion_filters do |f| %>
    <%= f.label do %>
      Monotheistic? <%= f.check_box :monotheistic, {}, true, false %>
    <% end %>
  
    <%= f.label :originated_in, "Originated" %>
    <%= f.select :originated_in, LOCATIONS %>
  <% end %>

  <%= submit_tag "Search Religions" %>
<% end %>
```

And get your controller to use `search`:

```ruby
class ReligionsController < ApplicationController
  def index
    @religions = Religion.search(params[:religion_filters])
  end
end
```

If you want to add a new filter, add the scope to the AR class and list it in `searchable_by`, then add an input to your form.

## Contributing

1. Fork it ( https://github.com/meritec/simple_searchable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
