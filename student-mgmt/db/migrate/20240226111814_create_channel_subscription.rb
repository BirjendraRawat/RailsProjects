class CreateChannelSubscription < ActiveRecord::Migration[7.1]
  def change
    create_table :channel_subscriptions do |t|
      t.references :subscriber, null: false, foreign_key: true
      t.references :video_channel, null: false, foreign_key: true
      t.datetime :subscribed_at

      t.timestamps
    end
  end
end
