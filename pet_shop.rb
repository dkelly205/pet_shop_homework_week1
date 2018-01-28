#
# customers = [
#   {
#     name: "Craig",
#     pets: [],
#     cash: 1000
#   },
#   {
#     name: "Zsolt",
#     pets: [],
#     cash: 50
#   }
# ]
#
# new_pet = {
#   name: "Bors the Younger",
#   pet_type: :cat,
#   breed: "Cornish Rex",
#   price: 100
# }
#
# pet_shop = {
#   pets: [
#     {
#       name: "Sir Percy",
#       pet_type: :cat,
#       breed: "British Shorthair",
#       price: 500
#     },
#     {
#       name: "King Bagdemagus",
#       pet_type: :cat,
#       breed: "British Shorthair",
#       price: 500
#     },
#     {
#       name: "Sir Lancelot",
#       pet_type: :dog,
#       breed: "Pomsky",
#       price: 1000,
#     },
#     {
#       name: "Arthur",
#       pet_type: :dog,
#       breed: "Husky",
#       price: 900,
#     },
#     {
#       name: "Tristan",
#       pet_type: :dog,
#       breed: "Basset Hound",
#       price: 800,
#     },
#     {
#       name: "Merlin",
#       pet_type: :cat,
#       breed: "Egyptian Mau",
#       price: 1500,
#     }
#   ],
#   admin: {
#     total_cash: 1000,
#     pets_sold: 0,
#   },
#   name: "Camelot of Pets"
# }


def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end


def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop, sold)
  return pet_shop[:admin][:pets_sold] += sold
end


def stock_count(pet_shop)
  return pet_shop[:pets].length()
end


def pets_by_breed(pet_shop, breed)
  same_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      same_breed.push(pet)
    end
  end
  return same_breed
end


def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end


def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
  return pet_shop[:pets].length()
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
  return customer[:pets].length
end



def customer_can_afford_pet(customer, new_pet)
  if new_pet[:price] > customer[:cash]
    return false
  else
    return true
  end
end


# def sell_pet_to_customer(pet_shop, pet, customer)
#   # check if customer can afford to buy the pet
#   if customer_can_afford_pet(customer, pet) == true
#
#   # add pet to customer
#   add_pet_to_customer(customer, pet)
#
#   # remove pet from store
#   remove_pet_by_name(pet_shop, pet)
#
#   sold = customer_pet_count(customer)
#   # increase pets sold in petshop
#   increase_pets_sold(pet_shop, sold)
#
#
#   # changing total cash in store
#   amount = pet[:price]
#   add_or_remove_cash(pet_shop, amount)
#
#   end
# end


def sell_pet_to_customer(pet_shop, pet, customer)

  # check if pet exists and if customer can afford to buy the pet
  if find_pet_by_name(pet_shop, pet) != nil && (customer_can_afford_pet(customer, pet) == true)

    # add pet to customer
    add_pet_to_customer(customer, pet)

    # remove pet from store
    remove_pet_by_name(pet_shop, pet)

    sold = customer_pet_count(customer)
    # increase pets sold in petshop
    increase_pets_sold(pet_shop, sold)

    # changing total cash in store
    amount = pet[:price]
    add_or_remove_cash(pet_shop, amount)
  end
end
