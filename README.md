# PatternRecognition

This is a small explanation how to test the classifiers for scenario 1 (500 training objects per class) and scenario 2 (10 training object per class).
The only thing you have to run is 'evaluation_nist_eval.m'.
Scripts used by running this are 'deskew_data.mat', 'preprocess_basic.m' and 'preprocess_deskewed.m'.
This script will initialize the training sets, train the classifiers and evaluate them with nist_eval for scenario 1 and 2.
To run tests for scenario 2 mexopencv (https://github.com/kyamagu/mexopencv) should be build with opencv-3.1.0.
