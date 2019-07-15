module RelationshipHelper
    def book_select
        Book.all.collect { |m| [m.title, m.id] }
    end

    def store_select
        Store.all.collect { |m| [m.codename, m.id] }
    end
end
