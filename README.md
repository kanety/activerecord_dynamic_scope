# ActiveRecordDynamicScope

Handling dynamic scope for ActiveRecord.

## Dependencies

* ruby 2.7+
* activerecord 6.0+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord_dynamic_scope'
```

Then execute:

    $ bundle

## Usage

Define a name of dynamic scope in your model using `dynamic_scope`:

```ruby
class Item < ActiveRecord::Base
  dynamic_scope :partition
end
```

The name of dynamic scope should be same as an attribute name because the name is used as a key of query.

Execute your query using `ActiveRecordDynamicScope.with` as follows:

```ruby
ActiveRecordDynamicScope.with(partition: 1) do
  Item.all  #=> SELECT "items".* FROM "items" WHERE "items"."partition" = 1
end
```

You can clear dynamic scope using `ActiveRecordDynamicScope.without` as follows:

```ruby
ActiveRecordDynamicScope.with(partition: 1) do
  Item.all.to_a  #=> SELECT "items".* FROM "items" WHERE "items"."partition" = 1
  ActiveRecordDynamicScope.without(:partition) do
    Item.all  #=> SELECT "items".* FROM "items"
  end
end
```

### Nested scope

You can also nest dynamic scope:

```ruby
class Item < ActiveRecord::Base
  dynamic_scope :partition1
  dynamic_scope :partition2
end

ActiveRecordDynamicScope.with(partition1: 1) do
  ActiveRecordDynamicScope.with(partition2: 2) do
    Item.all  #=> SELECT "items".* FROM "items" WHERE "items"."partition1" = 1 AND "items"."partition2" = 2
  end
end
```

### Alias name

You can use alias name if the name of dynamic scope is different from an attribute name:

```ruby
class Item < ActiveRecord::Base
  dynamic_scope :account, as: :partition
end

ActiveRecordDynamicScope.with(account: 1) do
  Item.all  #=> SELECT "items".* FROM "items" WHERE "items"."partition1" = 1 AND "items"."partition2" = 2
end
```

## Contributing

Bug reports and pull requests are welcome at https://github.com/kanety/activerecord_dynamic_scope.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
