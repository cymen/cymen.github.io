---
date: '2011-08-16 10:09:51'
layout: post
slug: yet-another-round-on-the-modelstate-percentcomplete-extension
status: publish
title: Yet another round on the ModelState PercentComplete() extension
wordpress_id: '216'
categories:
- ASP.NET MVC
- C#
---

So there were a few issues with the previous version -- at least when I wanted to extend it for some custom calculations so here is yet another version:


    
    
            public static int PercentComplete(this ModelStateDictionary modelStateDictionary, int? ScalePercentWithValueAsZero = null, int? MaxValue = 100)
            {
                int totalItems = 0;
                int validItems = 0;
                int percentComplete = 0;
    
                if (MaxValue.HasValue && (MaxValue.Value < 0 || MaxValue.Value > 100))
                    throw new ArgumentOutOfRangeException("MaxValue must between 0 and 100!");
    
                if (modelStateDictionary.IsValid)
                {
                    percentComplete = MaxValue.Value;
                }
                else
                {
                    foreach (var item in modelStateDictionary)
                    {
                        totalItems++;
                        if (item.Value.Errors.Count == 0)
                            validItems++;
                    }
    
                    if (totalItems > 0)
                        percentComplete = (100 * validItems) / totalItems;
    
                    if (ScalePercentWithValueAsZero.HasValue)
                    {
                        if (ScalePercentWithValueAsZero.Value >= percentComplete)
                        {
                            percentComplete = 0;
                        }
                        else
                        {
                            percentComplete = Convert.ToInt32(Math.Ceiling((double)(percentComplete - ScalePercentWithValueAsZero.Value) / (100 - ScalePercentWithValueAsZero.Value) * 100));
                        }
                    }
    
                    if (MaxValue.HasValue)
                    {
                        percentComplete = percentComplete * MaxValue.Value / 100;
                    }
                }
    
                return percentComplete;
            }
    



And if a model has a particularly complicated percentage complete calculation in which one needs to manually check some things and add to the total that can be done:


    
    
            public int CustomPercentComplete(Func<int?, int?, int> PercentComplete)
            {
                // scale percent complete 50-100% as 0-100%
                int basePercentAsZero = 50;
    
                // actually, scale 50-100% as 0-91%
                int max = 91;            
    
                // call default PercentComplete
                int percentComplete = PercentComplete(basePercentAsZero, max);
    
                // implement here your custom percente complete for the remaining 9%
    
                return percentComplete;
            }
    



An example of calling the custom percentage complete calculator on your model:


    
    
            myModelInstance.CustomPercentComplete(ModelState.PercentComplete);
    



And if you need to call either calculator but your controller action doesn't bind to an instance of the model you need to calculate the percentage on, you can add a method in your controller like this one (hopefully there is a better way -- let me know if you know of one):


    
    
            // Work around for getting percentage complete when in another action where the model is not the application
            // like so:
            // int percentComplete = MyPercentComplete(application);
            private int MyPercentComplete(MyApplication application)
            {
                return Convert.ToInt32(MyPercentCompleteAction(application).Content);
            }
    
            // Work around for getting percentage complete when in another action where the model is not the application
            // like so:
            // int percentComplete = Convert.ToInt32(MyPercentComplete(application).Content);
            private ContentResult MyPercentCompleteAction(MyApplication application)
            {
                return Content(application.CustomPercentComplete(ModelState.PercentComplete).ToString());
            }
    
