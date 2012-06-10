---
date: '2011-06-09 16:08:49'
layout: post
slug: asp-net-mvc-modelstate-and-simple-generic-percent-complete-helper-method
status: publish
title: ASP.NET MVC, ModelState and Simple Generic Percent Complete Helper Method
wordpress_id: '189'
categories:
- ASP.NET MVC
---

Say you have a number of models that are mostly comprised of plain old CLR objects and you need a rough percent complete calculator. Assuming you are using the standard ASP.NET MVC validation rules (via attributes), here is a rough helper method that can calculate the percentage complete for the model based on the number of fields with validation errors divided by the total number of fields.




    
    
            public static int PercentComplete(this ModelStateDictionary modelStateDictionary)
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
                
                return percentComplete;
            }
    
