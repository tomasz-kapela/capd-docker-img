//////////////////////////////////////////////////////////////////////////////
///
///  @file MyProgram.cpp
///  
///  @author kapela  @date   Feb 20, 2023
//////////////////////////////////////////////////////////////////////////////

#include "capd/capdlib.h"
#include "utils.h"
using namespace capd;

int main(){
  interval x = oneThird(); 
	std::cout << "1/3 = " << x << std::endl;
  return 0;
}
