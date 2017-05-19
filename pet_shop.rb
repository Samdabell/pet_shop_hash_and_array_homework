def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] = total_cash(pet_shop) + cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_sold)
  pet_shop[:admin][:pets_sold] = pets_sold(pet_shop) + number_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  breed_array = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breed_array.push(pet)
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == name
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
    pet_shop[:pets].delete(find_pet_by_name(pet_shop,name)) 
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if(new_pet != nil)
  if customer[:cash] >= new_pet[:price]
    return true
  end
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if customer_can_afford_pet(customer, pet) == true
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end
end