class Waiter
    @@all = []

    attr_accessor :name, :experience

    def initialize(name, experience)
        @name = name
        @experience = experience

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def customers
        self.meals.map {|meal| meal.customer}
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
          
        best_tipped_meal.customer         
    end

    # attempt
    def most_freq_customer
        self.customers.max_by {|elt| array.count(elt)}
    end
    
    # attempt
    def worst_tip_meal
        meals.min do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
    end

    def tips
        self.meals.map {|meal| meal.tips}
    end

    # attempt
    def self.tip_avg_most_experienced
        most_experienced = self.all.max do |waiter_a, water_b|
            waiter_a.experience <=> waiter_b.experience
        end

        most_experienced.tips.sum / most_experienced.size.to_f
    end

    # attempt
    def self.tip_avg_least_experienced
        least_experienced = self.all.min do |waiter_a, water_b|
            waiter_a.experience <=> waiter_b.experience
        end

        least_experienced.tips.sum / least_experienced.size.to_f
    end
end