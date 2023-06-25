Item.delete_all

3.times { |i| Item.create(title: "item1-#{i+1}", partition1: 1, partition2: i+1) }
3.times { |i| Item.create(title: "item2-#{i+1}", partition1: 2, partition2: i+1) }
3.times { |i| Item.create(title: "item3-#{i+1}", partition1: 3, partition2: i+1) }
