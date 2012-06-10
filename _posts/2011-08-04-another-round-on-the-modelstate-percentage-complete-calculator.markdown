---
date: '2011-08-04 13:29:31'
layout: post
slug: another-round-on-the-modelstate-percentage-complete-calculator
status: publish
title: Another round on the ModelState percentage complete calculator
wordpress_id: '212'
categories:
- ASP.NET MVC
---

Update: The mathematics is wrong -- not sure what I was thinking. See the [updated version here](http://blog.cymen.org/2011/08/16/yet-another-round-on-the-modelstate-percentcomplete-extension/).

So the prior version has a bug -- it works fine if the scaling value is 50 however it fails at other values. Whoops! That has been fixed and now we have a MaxValue scaler too. The MaxValue scaler is useful if you want to calculate the percentage done as maxing out at say 91% because you want to manually calculate the remaining 9%.


    
    
        public static class ModelStatePercentCompleteCalculator
        {
            // Very rough but reusable % complete calculator that is an extension so can be
            // called simply as ModelState.PercentComplete() in a controller action. Iterates
            // over the items in ModelState returns percentage complete where a complete field
            // is seen as having no errors. If the ModelState.IsValid returns true, the
            // model is 100% complete.
            //
            // ScalePercentWithValueAsZero: if you calculate the % done on a model and it says say 40%
            // really it is 0% than set ScalePercentWithValueAsZero=40 and it'll treat 40% as 0% and
            // scale it appropriately to 100 or maxValue
            //
            // MaxValue: if you want the maximum value to be less than 100 than set it here so you can
            // accomodate calculating to 100% based on some other criteria too (which you're
            // responsible for)
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
                        percentComplete = (MaxValue.Value * validItems) / totalItems;
                }
    
                if (ScalePercentWithValueAsZero.HasValue && ScalePercentWithValueAsZero.Value > 0 && percentComplete >= ScalePercentWithValueAsZero)
                {
                    percentComplete = (percentComplete - ScalePercentWithValueAsZero.Value) / (MaxValue.Value - ScalePercentWithValueAsZero.Value) * 100;
                }
                else
                {
                    percentComplete = percentComplete / 100 * MaxValue.Value;
                }
    
                return percentComplete;
            }
    
