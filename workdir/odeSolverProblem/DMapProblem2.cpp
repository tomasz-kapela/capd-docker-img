#include <iostream>
#include "capd/capdlib.h"
#include "capd/map/Map.hpp"
using namespace capd;
using namespace std;
// ####################################################
int main(){
  int order=15;         // of Taylor method

  auto res1 = DVector::makeArray(20,2);
  auto res2 = DVector::makeArray(20,2);

  DVector u1({1,3});

  string vfFormula1 = "var:x,y;fun:3-y,-y;";
  string vfFormula2 = "var:x,y;fun:-y+3,-y;";

  DMap vf1(vfFormula1);
  DMap vf2(vfFormula2);

  vf1.setOrder(15);
  vf2.setOrder(15);

  res1[0] = u1;
  vf1.computeODECoefficients(res1, order);
  res2[0] = u1;
  vf2.computeODECoefficients(res2, order);

  for(int i=0;i<order;++i) {
     cout << res1[i] << ", " << res2[i] << "\t " << (res1[i] - res2[i])<< endl;
  }
}
//
