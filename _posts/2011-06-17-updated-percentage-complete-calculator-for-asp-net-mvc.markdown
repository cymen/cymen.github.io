---
date: '2011-06-17 17:34:25'
layout: post
slug: updated-percentage-complete-calculator-for-asp-net-mvc
status: publish
title: Updated percentage complete calculator for ASP.NET MVC
wordpress_id: '205'
---

Update: there is a bug with this code. Please see [this new post with updated code](http://blog.cymen.org/2011/08/04/another-round-on-the-modelstate-percentage-complete-calculator/).

This version adds a baseline value so the percentage is scaled from that baseline (as 0) to 100%. This is to accommodate the case where the form starts out at say 50% complete. In this case, the call in the controller would be:


    
    
        x.PercentComplete = ModelState.PercentComplete(50);
    



Note this will cause some odd results if you pick a base value that isn't truly a base value. In that case, the percentage calculation as the model is "completed" will increase, dip to zero at the false base value and then increase to 100 from there.


    
    
        public static class ModelStatePercentCompleteCalculator
        {
            // Very rough but reusable % complete calculator that is an extension so can be
            // called simply as ModelState.PercentComplete() in a controller action. Iterates
            // over the items in ModelState returns percentage complete where a complete field
            // is seen as having no errors. If the ModelState.IsValid returns true, the
            // model is 100% complete.
            public static int PercentComplete(this ModelStateDictionary modelStateDictionary, int? ScalePercentWithValueAsZero = null)
            {
                int totalItems = 0;
                int validItems = 0;
                int percentComplete = 0;
    
                if (modelStateDictionary.IsValid)
                {
                    percentComplete = 100;
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
                }
    
                if (ScalePercentWithValueAsZero.HasValue && ScalePercentWithValueAsZero.Value > 0 && percentComplete >= ScalePercentWithValueAsZero)
                {
                    percentComplete = 100 / ScalePercentWithValueAsZero.Value * (percentComplete - ScalePercentWithValueAsZero.Value);
                }
    
                return percentComplete;
            }
        }
    
