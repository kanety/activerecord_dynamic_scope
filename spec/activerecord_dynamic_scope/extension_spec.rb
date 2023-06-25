describe ActiveRecordDynamicScope do
  context 'with dynamic scope' do
    it 'runs dynamic scope' do
      ActiveRecordDynamicScope.with(partition1: 1) do
        expect(Item.all.count).to eq(3)
      end
    end

    it 'overwrites dynamic scope' do
      ActiveRecordDynamicScope.with(partition1: 1) do
        expect(Item.all.count).to eq(3)
        ActiveRecordDynamicScope.with(partition1: 9) do
          expect(Item.all.count).to eq(0)
        end
        expect(Item.all.count).to eq(3)
      end
    end
  end

  context 'without dynamic scope' do
    it 'clears dynamic scope in without block' do
      ActiveRecordDynamicScope.with(partition1: 1) do
        expect(Item.all.count).to eq(3)
        ActiveRecordDynamicScope.without(:partition1) do
          expect(Item.all.count).to eq(9)
        end
      end
    end
  end

  context 'nested dynamic scope' do
    it 'runs nested dynamic scope' do
      ActiveRecordDynamicScope.with(partition1: 1) do
        ActiveRecordDynamicScope.with(partition2: 1) do
          expect(Item.all.count).to eq(1)
        end
        ActiveRecordDynamicScope.with(partition2: 9) do
          expect(Item.all.count).to match(0)
        end
      end
    end
  end

  context 'aliased name' do
    it 'runs with aliased name' do
      ActiveRecordDynamicScope.with(aliased_partition: 1) do
        expect(Item.all.count).to eq(3)
      end
    end
  end

  context 'unknown name' do
    it 'does not affect unknown scope' do
      ActiveRecordDynamicScope.with(unknown_partition: 1) do
        expect(Item.all.count).to eq(9)
      end
    end
  end
end
