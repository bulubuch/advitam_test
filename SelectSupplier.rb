class SelectSupplier
	attr_accessor :suppliers, :grade_weight

	def initialize(suppliers)
		raise TypeError, "suppliers should be an Array of supplier containing name, advitam_grade and works list" unless suppliers.is_a?(Array)
		for supplier in suppliers
			raise TypeError, "Each suppliers should contain: name, advitam_grade and works list" unless supplier.key?(:name) and supplier.key?(:advitam_grade) and supplier.key?(:works)
			for work in supplier[:works]
				raise TypeError, "Each supplier work must have a type and a price" unless work.key?(:type) and work.key?(:price)
			end
		end
		@suppliers = suppliers
	end

	def work(work_type)
		best = nil
		for supplier in @suppliers
			for work in supplier[:works]
				if work[:type] == work_type
					if best == nil
						best = supplier
					else
						if supplier_grade(supplier[:name], work_type) >
						supplier_grade(best[:name], work_type)
							best = supplier
						end
					end
				end
			end
		end
		best
	end

	def work_all(work_type)
		ordered = []
		for supplier in @suppliers
			for work in supplier[:works]
				if work[:type] == work_type
					if ordered.length() == 0
						ordered.push(supplier)
					else
						i = 0
						while i < ordered.length()
							if supplier_grade(supplier[:name], work_type) >
							supplier_grade(ordered[i][:name], work_type)
								break
							end
							i += 1
						end
						ordered.insert(i, supplier)
					end
					break
				end
			end
		end
		ordered
	end

	def suppliers
		ordered = @suppliers
		len = ordered.length()
		i = 0
		while i < len
			j = i + 1
			while j < len
				if ordered[j][:advitam_grade] > ordered[i][:advitam_grade]
					best = ordered[j]
					ordered[j] = ordered[i]
					ordered[i] = best
				end
				j += 1
			end
			i += 1
		end
		ordered
	end

	def supplier_grade(supplier_name, work_type)
		raise StandardError, "grade_weight should be defined to process grade_weight" unless @grade_weight
		for supplier in @suppliers
			if supplier[:name] == supplier_name
				for work in supplier[:works]
					if work[:type] == work_type
						return (@grade_weight * supplier[:advitam_grade]) + work[:price]
					end
				end
				raise StandardError, "Supplier work not found"
			end
		end
		raise StandardError, "Supplier not found"
	end

	def grade_weight
		@grade_weight
	end

	def grade_weight=(value)
		@grade_weight =  value
	end
end


suppliers = [
    { name: "FunePlus", advitam_grade: 3, works: [ { type: "embalming", price: 350 }, {type: "transport_before_casketing", price: 450}, {type: "graving", price: 40} ]},
    { name: "FuneTop", advitam_grade: 1, works: [ { type: "graving", price: 10 } ]},
    { name: "FuneBest", advitam_grade: 4,works: [ { type: "embalming", price: 450 }]},
    { name: "FuneTruc", advitam_grade: 5,works: [ { type: "embalming", price: 750 }]},
    { name: "FuneWorker", advitam_grade: 5,works: [ { type: "digging", price: 280 }, { type: "embalming", price: 760 }, { type: "graving", price: 60 }]},
    { name: "FuneCorp", advitam_grade: 2, works: [ { type: "digging", price: 350 }]}
]

select = SelectSupplier.new(suppliers)
print(select.grade_weight)
select.grade_weight = 100
puts (select.grade_weight)
puts "WORK:"
puts select.work("embalming")
puts "WORK ALL embalming:"
puts select.work_all("embalming")
puts "WORK ALL graving:"☺
puts select.work_all("graving")
puts "WORK ALL digging:"
puts select.work_all("digging")
puts "SUPPLIERS:"
puts select.suppliers