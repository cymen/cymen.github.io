---
date: '2012-03-12 11:39:17'
layout: post
slug: the-l-in-solid-liskov-substitution-principle
status: publish
title: 'The L in SOLID: Liskov substitution principle'
wordpress_id: '488'
categories:
- 8th Light
- Apprentice
- Design
- SOLID
---

[SOLID](http://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) is an acronym from [Robert C. Martin](http://www.objectmentor.com/omTeam/martin_r.html) to aid in remembering these basic principles:

1. [Single responsibility principle](http://en.wikipedia.org/wiki/Single_responsibility_principle)
2. [Open/closed principle](http://en.wikipedia.org/wiki/Open/closed_principle)
3. [Liskov substitution principle](http://en.wikipedia.org/wiki/Liskov_substitution_principle)
4. [Interface segregation principle](http://en.wikipedia.org/wiki/Interface_segregation_principle)
5. [Dependency inversion principle](http://en.wikipedia.org/wiki/Dependency_inversion_principle)

**Liskov substitution principle**

The principle was defined by [Barbara Liskov](http://en.wikipedia.org/wiki/Barbara_Liskov) and can be paraphrased as: Subtypes must be substitutable for their base types. Martin discusses this principle in [Agile Software Development: Principles, Patterns and Practices](http://www.amazon.com/Software-Development-Principles-Patterns-Practices/dp/0135974445/) with some observations:

* A typical violation of the Liskov substitution principle is seen in code that branches by type inspection (see below). This is a violation of the [open/closed principle](http://en.wikipedia.org/wiki/Open/closed_principle) as an addition of another type related to payment (ie PayPal) would require changes to this code.

        if (object.Type == "MoneyOrder") {
          ...
        }
        else if (object.Type == "PersonalCheck") {
          ...
        }

* A more complex example of a violation can be seen when attempting to shoe horn an additional object on top of a base class that does not have the same behavior. Martin's example is a Square class that inherits from a Rectangle class. The issue with this is that if Rectangle has methods to set the height and width of the rectangle then Square must also have these methods. But in Square, when either height or width is set the other length must also be set (in other words, if I create a Square with height 5 and width 5 and then set the height to 10 the width must also be set to 10 otherwise it would not be a square). The problem is setting the height of width of a Square has a side effect and because of this it violates the Liskov substitution principle. Martin's example of this violation is a method that calculates the area of a Rectangle. It would be reasonable to expect setting width = 5 and height = 4 would return area = 20 however for Square this is not the case -- it will return 16 if the height is set last or 25 if the width is set last! It is of course possible to override the base method that calculates area however the test will still fail. A Square cannot be substituted for a Rectangle.
* It is reasonable to expect the behavior of classes to conform to the base type. That just because the Square class is a valid Rectangle does not mean it is a valid design because the clients of the class cannot treat them the same!
* ISA is about behavior: you might consider a Square is a Rectangle during design but a test that expects to set the width to 5 and the heigh to 4 and get an area of 20 for any Rectangle would fail! So by behavior, a Square is not a Rectangle. In other words, the consumers of your classes expect reasonable behavior (and when this behavior is violated they themselves will have to violate the Liskov substitution principle to work around the issue or try to fix the design).
* Testing is a great way to clarify and document the behavior of a class.

Martin includes more complex examples of the violations along with good and bad solutions to violates. He also identifies some quick methods of finding potential violations:

* A derived class has an override of a method with an empty body (aka a degenerate function).
* A derived class throws an exception on a method that base classes do not.


**Why does the Liskov subsitution principle matter today with dynamic code?**

Because at it's heart as Martin reiterates the principle is really concerned with behavior. It doesn't really matter if the language is Ruby or C#: consumers of classes will have reasonable expectations of behavior. If these expectations are violated the quick fix is a violation of the [open/closed principle](http://en.wikipedia.org/wiki/Open/closed_principle) and that has a negative impact on the project as it is now harder to maintain, less resuable and less robust.

**Why is a "quick fix" a violation of the open/closed principle?**

I'll write about the open/closed principle another day but a quick summary of it is that classes (or other entities) should be open for extension but closed for modification. The reason a quick fix of the Liskov substitution principle is almost certainly a violate of the open/closed principle is that the easiest solution is to inspect the type of the object instance and handle the type with different behavior differently. In other words, to branch on object type. This violates the open/closed principle because any time a new type is introduced the class that holds this branching logic will need to be updated.

**Resources**

* Barbara Liskov's [keynote address to OOPSLA 1987 conference](http://dl.acm.org/citation.cfm?id=62141) (in which the principle was first discussed, unfortunately behind ACM paywall)
* Robert C. Martin - [The Liskov Substitution Principle](http://www.objectmentor.com/resources/articles/lsp.pdf) (PDF, second column for The C++ Report)
* Robert C. Martin - [Agile Software Development: Principles, Patterns and Practices](http://www.amazon.com/Software-Development-Principles-Patterns-Practices/dp/0135974445/)
