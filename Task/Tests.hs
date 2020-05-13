module Task.Tests where

import Test.HUnit
import Task.Exercises

tests = test [ 
  "2.1) a)" ~: [1,11,121,1331,14641,161051,1771561] ~=? ex2A,
  "2.1) b)" ~: [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23, 25,26,27,29,30,31,33,34,35,37,38,39] ~=? ex2B,
  "2.1) c)" ~: ["AaBB", "AbBB", "AcBB", "AdBB", "AeBB", "AfBB", "AgBB"] ~=? ex2C,
  "2.1) d)" ~: [5,8,11,17,20,26,29,32,38,41] ~=? ex2D,
  "2.1) e)" ~: [1.0,0.5,0.25,0.125,0.0625,0.03125] ~=? ex2E,
  "2.1) f)" ~: [1,10,19,28,37,46,55,64] ~=? ex2F,
  "2.1) g)" ~: [2,4,8,10,12,16,18,22,24,28,30] ~=? ex2G,
  "2.1) h)" ~: ['@','A','C','D','E','G','J','L'] ~=? ex2H,
  "4.6) 1)" ~: "CETAFFTC" ~=? func removeVowels "FATEC",
  "4.6) 2)" ~: "CETAFFATEC" ~=? func (\x -> x) "FATEC",
  "4.7) 1)" ~: [Tuesday] ~=? filterTuesday weekdays,
  "4.7) 2)" ~: [Tuesday, Tuesday, Tuesday] ~=? filterTuesday [Monday, Tuesday, Wednesday, Tuesday, Friday, Tuesday]]
