class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :last_transaction

    def initialize employee_discount = 0
        @total = 0
        @discount = employee_discount
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times { self.items << title }
    end

    def apply_discount
        if self.discount > 0
            self.total -= self.discount/100.0 * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end