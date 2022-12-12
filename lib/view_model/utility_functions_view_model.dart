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

double activity_level(int activity){
  // 1 -> sedentary (little to no exercise)
  // 2 -> lightly active (light exercise 1–3 days per week)
  // 3 -> moderately active (moderate exercise 3–5 days per week)
  // 4 -> very active (hard exercise 6–7 days per week)
  // 5 -> extra active (very hard exercise, training, or a physical job)
  if (activity == 1){
    return 1.2;
  }
  else if (activity == 2){
    return 1.375;
  }
  else if (activity == 3){
    return 1.55;
  }
  else if (activity == 4){
    return 1.725;
  }
  else {
    return 1.9;
  }
}

double maintain_weight(bool gender, int age, double weight, double height, int activity){
  double rmr = rmr_calculation(gender = gender, age = age, weight= weight , height = height);
  double activityMultiplier = activity_level(activity);
  return rmr * activityMultiplier; 
}