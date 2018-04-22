db = db.getSiblingDB("xb306");
print("\nCount the numbers of different races\n");
db.t3.aggregate([{$group:{_id:"$Race", Count:{$sum : 1}}}, {$sort:{Count: -1}}]);
print("\nCount the numbers of states\n");
db.t3.aggregate([{$group:{_id:"$State", Count:{$sum : 1}}}, {$sort:{Count: -1}}]);
print("\nCount the numbers of genders\n");
db.t3.aggregate([{$group:{_id:"$Gender", Count:{$sum : 1}}}, {$sort:{Count: -1}}]);
print("\nFind the numbers of Hispanic/Latino individuals in different state\n");
db.t3.aggregate([{$match:{SpaOrLat:"Hispanic or Latino"}},{$group:{_id:"$State", HispanicOrLatino:{$sum : 1}}}, {$sort:{HispanicOrLatino: -1}}]);
print("\nFind the numbers of different races in California\n");
db.t3.aggregate([{$match:{State_Abbr:"CA"}},{$group:{_id:"$Race", Count:{$sum : 1}}}, {$sort:{Count: -1}}]);
print("\nFind the number of white female with manufactured housing dwelling in Texas\n");
db.t3.aggregate([{$match:{State_Abbr:"TX", Race:"White", Dwelling:"Manufactured housing"}},{$group:{_id:"$Race", Count:{$sum : 1}}}, {$sort:{Count: -1}}]);
print("\nFind the most popular loan type and purpose\n");
db.t3.aggregate([{$group:{_id:{"MostPopularType":"$Loan_Type"}, Count:{$sum : 1}}}, {$sort:{Count: -1}}, {$limit:1}]);
db.t3.aggregate([{$group:{_id:{"MostPopularPurpose":"$Loan_Type"}, Count:{$sum : 1}}}, {$sort:{Count: -1}}, {$limit:1}]);
print("\n");