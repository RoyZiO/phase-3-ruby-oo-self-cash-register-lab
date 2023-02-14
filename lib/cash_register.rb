class CashRegister
    attr_accessor :total, :items, :discount, :prev_transaction
    def initialize(discount = 0)
        @items = []
        @discount = discount
        @total = 0
    end

    def add_item(name, price, quantity = 1)
        @total += price * quantity
        quantity.times {@items << name}
        self.prev_transaction = price * quantity
    end

    def apply_discount
        if discount > 0
            self.total = (total * ((100.0 - discount.to_f) / 100)).to_i
            "After the discount, the total comes to $#{self.total}."
          else
            "There is no discount to apply."
          end
    end

    def void_last_transaction
        self.total -= self.prev_transaction
    end

end
