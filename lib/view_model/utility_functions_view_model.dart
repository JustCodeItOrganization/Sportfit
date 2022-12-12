double basal_metabolism(bool gender, int age, double weight, double length){
  //length is cm
  //weight is kg
  
  double initConst;
  double weightMultiplier;
  double lengthMultiplier;
  double ageMultiplier;

  if (gender){
  initConst = 66.5;
  weightMultiplier = 13.75;
  lengthMultiplier = 5;
  ageMultiplier = 6.77;
  }
  else{
  initConst = 665.1;
  weightMultiplier = 9.56;
  lengthMultiplier = 1.85;
  ageMultiplier = 4.67; 
  }
  return initConst + (weightMultiplier * weight) + (lengthMultiplier * length) - (ageMultiplier*age);
}

double rmr_calculation(bool gender, int age, double weight, double height){
  // centimeter for lenght
  // kg for weight
  double initCost;
  double weightMultiplier = 9.99;
  double heightMultiplier = 6.25;
  double ageMultiplier = 4.92;
  //gender == true -> man
  if (gender){
  initCost = 5;
  }
  else{
  initCost = -161;
  }
  return initCost + weight* weightMultiplier + height * heightMultiplier - age * ageMultiplier;
}

double activity(int fitnesslevel){
  // 1 -> sedentary (little to no exercise)
  // 2 -> lightly active (light exercise 1–3 days per week)
  // 3 -> moderately active (moderate exercise 3–5 days per week)
  // 4 -> very active (hard exercise 6–7 days per week)
  // 5 -> extra active (very hard exercise, training, or a physical job)
  if (fitnesslevel == 1){
    return 1.2;
  }
  else if (fitnesslevel == 2){
    return 1.375;
  }
  else if (fitnesslevel == 3){
    return 1.55;
  }
  else if (fitnesslevel == 4){
    return 1.725;
  }
  else {
    return 1.9;
  }
}

double maintain_weight(bool gender, int age, double weight, double height, int fitnesslevel){
  double rmr = rmr_calculation(gender = gender, age = age, weight= weight , height = height);
  double activityMultiplier = activity(fitnesslevel);
  return rmr * activityMultiplier; 
}

double food_calorie(double base_weight, double base_calorie, double weight){
  return weight/base_weight * base_calorie;
}

double workout_calorie(bool gender, double weight, double time){
  //gender == true -> man.
  double genderRatio = 1.0;
  double baseWeight = 40;
  double upperWeight = 150;
  double baseCalorie = 1.7;
  double upperCalorie = 3.1;
  double weightRatio;
  double calorieRatio;
  if (weight >= baseWeight && weight <= upperWeight){
    weightRatio = (weight - baseWeight)/(upperWeight - baseWeight);
  }
  else if (weight > upperWeight){
    weightRatio = 1.0;
  }
  else {
    weightRatio = 0.0;
  }
  if (!gender)genderRatio = 0.6074;
  calorieRatio = baseCalorie + (upperCalorie - baseCalorie) * weightRatio;
  return time * calorieRatio * genderRatio;
   
}
double exercise_calorie(double met, double body_weight){
  return met * 3.5 * body_weight / 200.0;
}
Map bicycling_mets(){
  //mph: met
  return {
    //mph:met
    0.0:4,
    10.0:6,
    12.0:8,
    14.0:10,
    16.0:12,
    20.0:16
  };
}

Map running_mets(){
  //mph:met
  return {
   0.0  :6.0, 
   5.0  :8.0,	      
	 5.2  :9.0,      
	 6.0  :10.0,	   
	 6.7  :11.0,	  
	 7.0  :11.5,	  
	 7.5  :12.5,	
	 8.0  :13.5,	  
	 8.6  :14.0,	  
	 9.0  :15.0,	    
	 10.0 :16.0,	  
	 10.9 :18.0
   };	 
}


double weight_lifting_calorie(double body_weight){
  double met = 3.5;
  return exercise_calorie(met = met, body_weight = body_weight);
}

double cardio_calorie(double mph, bool activity, double body_weight, double minute){
  // activity == true  -> running
  // activity == false -> bicycling
  Map map_met;
  double met = 0;
  if (activity) map_met = running_mets();
  else map_met = bicycling_mets();
  for (MapEntry e in map_met.entries){
    if (mph >= map_met[e]) met = map_met[e];
  }
  return minute * exercise_calorie(met, body_weight);
}