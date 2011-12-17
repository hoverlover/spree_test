if ActiveRecord::Base.connection.tables.include?("spree_preferences")
  class SchemaMigration < ActiveRecord::Base; end

  if SchemaMigration.find_by_version('20111205231500')
    Spree.config do |config|
      config.track_inventory_levels = false
      config.allow_backorder_shipping = true
      config.checkout_zone = 'US'

      # The IDs for countries are specified while seeding,
      # so this is why it's safe to use the ID here.
      config.default_country_id = 214 # US
    end
  end
end

