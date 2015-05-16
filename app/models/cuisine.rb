class Cuisine < ActiveRecord::Base
  #dependent destroy...if we destroy Cuisine, we should destroy from CusineRestaurants

end
