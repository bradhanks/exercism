# pytorch-tf Package

This package is a really simple conversion tool that takes a torch Dataset and converts it to a tensorflow Dataset.

I make use of the fact that you can destructure a torch dataset into individual torch.Tensors. 
Then I convert the torch tensors into numpy arrays. I add a dimension to the arrays, concatenate them and put them into a tensor. This is specifically written for one specific torch dataset that is found in a (Kaggle competition)[https://www.kaggle.com/c/jovian-pytorch-z2g/overview] that is part of a course put together by jovivan.ml in conjunction from (freeCodeCamp.org)[freeCodeCamp.org].
