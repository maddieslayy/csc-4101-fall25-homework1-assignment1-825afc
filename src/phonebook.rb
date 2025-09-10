class PhoneBook
    def initialize
        @entries = []
        @names = {}
        @numbers = Hash.new { |h, k| h[k] = [] }
    end

    def add(name, number, is_listed)
        return false if @names.key?(name)
        return false unless number =~ /^\d{3}-\d{3}-\d{4}$/

        listed_count = @entries.count { |e| e[:number] == number && e[:is_listed] }
        if is_listed && listed_count > 0
            return false
        end
        entry = { name: name, number: number, is_listed: is_listed }
        @entries << entry
        @names[name] = entry
        @numbers[number] << entry
        true
    end

    def lookup(name)
        entry = @names[name]
        return nil unless entry && entry[:is_listed]
        entry[:number]
    end

    def lookupByNum(number)
        entries = @numbers[number]
        listed = entries.find { |e| e[:is_listed] }
        listed ? listed[:name] : nil
    end

    def namesByAc(areacode)
        @entries.select { |e| e[:number].start_with?(areacode + '-') }.map { |e| e[:name] }
    end
end
