# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 1.0.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Subscriptions
  module Models
    #
    # Subscription policies.
    #
    class SubscriptionPolicies

      include MsRestAzure

      # @return [String] The subscription location placement Id. The Id
      # indicates which regions are visible for a subscription. For example,
      # a subscription with a location placement Id of Public_2014-09-01 has
      # access to Azure public regions.
      attr_accessor :location_placement_id

      # @return [String] The subscription quota Id.
      attr_accessor :quota_id

      # @return [SpendingLimit] The subscription spending limit. Possible
      # values include: 'On', 'Off', 'CurrentPeriodOff'
      attr_accessor :spending_limit


      #
      # Mapper for SubscriptionPolicies class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'SubscriptionPolicies',
          type: {
            name: 'Composite',
            class_name: 'SubscriptionPolicies',
            model_properties: {
              location_placement_id: {
                required: false,
                read_only: true,
                serialized_name: 'locationPlacementId',
                type: {
                  name: 'String'
                }
              },
              quota_id: {
                required: false,
                read_only: true,
                serialized_name: 'quotaId',
                type: {
                  name: 'String'
                }
              },
              spending_limit: {
                required: false,
                read_only: true,
                serialized_name: 'spendingLimit',
                type: {
                  name: 'Enum',
                  module: 'SpendingLimit'
                }
              }
            }
          }
        }
      end
    end
  end
end
