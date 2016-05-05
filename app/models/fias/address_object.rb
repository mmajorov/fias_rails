require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('postgis')
module Fias
  class AddressObject < ActiveRecord::Base
    include Fias::Concerns::Uploadable
    #include Fias::Concerns::Updatable

    scope :child_of, ->(parent) { where(parentguid: parent) }
    scope :level, ->(level) { where(aolevel: level) }
    scope :regions, -> { level(1) }
    scope :areas, -> { level(3) }
    scope :cities, -> { level(4) }
    scope :towns, -> { level([5, 6]) }
    scope :streets, -> { level(7) }
    scope :active, ->{ where(actstatus: '1', livestatus: '1') }

    def self.batch_update(attrs)
      created = 0
      self.transaction do
        addresses = []
        exists = Set.new(self.where(aoid: attrs.collect { |h| h[:aoid] }).pluck(:aoid))
        attrs.each { |hash|
          unless exists.include? hash[:aoid]
            addresses << self.new(hash)
            created+=1
          else
            self.where(aoid: hash[:aoid]).update_all(hash)
          end
        }
        self.import addresses, {:validate => false}
      end
      created
    end
  end
end
