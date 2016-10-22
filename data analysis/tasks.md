# Aufgabenblatt **Datenanalyse**

## Aufgabe 1a) Recall & Precision Values

#### a. DTNB Algortihmus

    === Run information ===

    Scheme:       weka.classifiers.rules.DTNB -X 1
    Relation:     poker-hand-training-true
    Instances:    25010
    Attributes:   11
              Farbe Karte 1
              Wert Karte 1
              Farbe Karte 2
              Wert Karte 2
              Farbe Karte 3
              Wert Karte 3
              Farbe Karte 4
              Wert Karte 4
              Farbe Karte 5
              Wert Karte 5
              Poker Hand
    Test mode:    user supplied test set:  size unknown (reading incrementally)

    === Classifier model (full training set) ===

    Decision Table:

    Number of training instances: 25010
    Number of Rules : 64
    Non matches covered by Majority class.
    Evaluation (for feature selection): CV (leave one out)
    Feature set: 5,7,9,11

    Time taken to build model: 30.46 seconds

    === Evaluation on test set ===

    Time taken to test model on supplied test set: 4.43 seconds

    === Summary ===

    Correctly Classified Instances       49472               49.472  %
    Incorrectly Classified Instances     50528               50.528  %
    Kappa statistic                          0.0051
    Mean absolute error                      0.1151
    Root mean squared error                  0.2385
    Relative absolute error                101.2411 %
    Root relative squared error            100.0341 %
    Total Number of Instances           100000     

    === Detailed Accuracy By Class ===

                 TP Rate  FP Rate  Precision  Recall   F-Measure  MCC      ROC Area  PRC Area  Class
                 0,000    0,000    0,000      0,000    0,000      0,000    0,993     0,001     Royal Flush
                 0,000    0,000    0,000      0,000    0,000      0,000    0,955     0,000     Straight Flush
                 0,115    0,110    0,431      0,115    0,181      0,007    0,509     0,427     Ein Paar
                 0,891    0,885    0,503      0,891    0,643      0,010    0,518     0,517     Hoechste Karte
                 0,000    0,000    0,000      0,000    0,000      0,000    0,519     0,004     Strasse
                 0,000    0,000    0,000      0,000    0,000      0,000    0,546     0,024     Drilling
                 0,000    0,000    0,000      0,000    0,000      0,000    0,530     0,054     Zwei Paar
                 0,000    0,000    0,000      0,000    0,000      0,000    0,974     0,036     Flush
                 0,000    0,000    0,000      0,000    0,000      0,000    0,444     0,001     Full House
                 0,000    0,000    0,000      0,000    0,000      0,000    0,343     0,000     Vierling
    Weighted Avg.    0,495    0,490    0,434      0,495    0,399      0,008    0,516     0,443     

    === Confusion Matrix ===

     a     b     c     d     e     f     g     h     i     j   <-- classified as
     0     0     0     1     0     0     0     0     0     0 |     a = Royal Flush
     0     0     0     1     0     0     0     0     0     0 |     b = Straight Flush
     0     0  4847 37338     0     0     0     0     0     0 |     c = Ein Paar
     0     0  5475 44625     0     0     0     0     0     0 |     d = Hoechste Karte
     0     0    39   340     0     0     0     0     0     0 |     e = Strasse
     0     0   251  1847     0     0     0     0     0     0 |     f = Drilling
     0     0   601  4272     0     0     0     0     0     0 |     g = Zwei Paar
     0     0     0   195     0     0     0     0     0     0 |     h = Flush
     0     0    20   130     0     0     0     0     0     0 |     i = Full House
     0     0     1    17     0     0     0     0     0     0 |     j = Vierling

#### b. NaiveBayesAlgorithmus

    === Run information ===

    Scheme:       weka.classifiers.bayes.NaiveBayes
    Relation:     poker-hand-training-true
    Instances:    25010
    Attributes:   11
                  Farbe Karte 1
                  Wert Karte 1
                  Farbe Karte 2
                  Wert Karte 2
                  Farbe Karte 3
                  Wert Karte 3
                  Farbe Karte 4
                  Wert Karte 4
                  Farbe Karte 5
                  Wert Karte 5
                  Poker Hand
    Test mode:    user supplied test set:  size unknown (reading incrementally)

    === Classifier model (full training set) ===

    Naive Bayes Classifier

                             Class
    Attribute          Royal Flush Straight Flush       Ein Paar Hoechste Karte        Strasse       Drilling      Zwei Paar          Flush     Full House       Vierling
                               (0)            (0)         (0.42)          (0.5)            (0)         (0.02)         (0.05)            (0)            (0)            (0)
    ======================================================================================================================================================================
    Farbe Karte 1
      Herz                      2.0            3.0         2627.0         3091.0           29.0          121.0          263.0           13.0           10.0            1.0
      Pik                       2.0            2.0         2663.0         3154.0           18.0          124.0          324.0           12.0            7.0            2.0
      Karo                      2.0            2.0         2677.0         3074.0           32.0          135.0          309.0           13.0           12.0            4.0
      Kreuz                     3.0            2.0         2636.0         3178.0           18.0          137.0          314.0           20.0           11.0            3.0
      [total]                   9.0            9.0        10603.0        12497.0           97.0          517.0         1210.0           58.0           40.0           10.0

    Wert Karte 1
      mean                      8.8            3.6         6.9947         6.9853         7.5161         6.6803         7.1965         7.2222         6.9444         6.6667
      std. dev.              3.9699         3.0725         3.7534         3.7458         3.6059          3.823         3.7264         3.8714         3.2994         3.1447
      weight sum                  5              5          10599          12493             93            513           1206             54             36              6
      precision                   1              1              1              1              1              1              1              1              1              1

    Farbe Karte 2
      Herz                      2.0            3.0         2668.0         3161.0           23.0          129.0          310.0           13.0            9.0            1.0
      Pik                       2.0            2.0         2682.0         3065.0           30.0          139.0          307.0           12.0           11.0            4.0
      Karo                      2.0            2.0         2599.0         3118.0           22.0          120.0          277.0           13.0           12.0            2.0
      Kreuz                     3.0            2.0         2654.0         3153.0           22.0          129.0          316.0           20.0            8.0            3.0
      [total]                   9.0            9.0        10603.0        12497.0           97.0          517.0         1210.0           58.0           40.0           10.0

    Wert Karte 2
      mean                     11.8            5.6         7.0004         7.0377         7.8925         6.9201         6.8922         6.6481           6.25            6.5
      std. dev.              0.9798         3.4409         3.7576         3.7636           3.31          3.852         3.8651         3.7226         3.7072         3.0957
      weight sum                  5              5          10599          12493             93            513           1206             54             36              6
      precision                   1              1              1              1              1              1              1              1              1              1

    Farbe Karte 3
      Herz                      2.0            3.0         2650.0         3108.0           23.0          126.0          300.0           13.0           12.0            3.0
      Pik                       2.0            2.0         2686.0         3068.0           20.0          116.0          303.0           12.0            7.0            2.0
      Karo                      2.0            2.0         2551.0         3126.0           30.0          131.0          297.0           13.0            8.0            3.0
      Kreuz                     3.0            2.0         2716.0         3195.0           24.0          144.0          310.0           20.0           13.0            2.0
      [total]                   9.0            9.0        10603.0        12497.0           97.0          517.0         1210.0           58.0           40.0           10.0

    Wert Karte 3
      mean                      9.8            5.8         6.9875         7.0467         7.7849         6.8441          6.927         6.9074         6.9167            6.5
      std. dev.              4.5343         3.1875         3.7409          3.742          3.172         3.7706          3.831         3.8886          3.235         3.0957
      weight sum                  5              5          10599          12493             93            513           1206             54             36              6
      precision                   1              1              1              1              1              1              1              1              1              1

    Farbe Karte 4
      Herz                      2.0            3.0         2635.0         3164.0           31.0          128.0          285.0           13.0           12.0            6.0
      Pik                       2.0            2.0         2686.0         3115.0           26.0          136.0          263.0           12.0           15.0            1.0
      Karo                      2.0            2.0         2684.0         3105.0           19.0          131.0          356.0           13.0           10.0            2.0
      Kreuz                     3.0            2.0         2598.0         3113.0           21.0          122.0          306.0           20.0            3.0            1.0
      [total]                   9.0            9.0        10603.0        12497.0           97.0          517.0         1210.0           58.0           40.0           10.0

    Wert Karte 4
      mean                     11.6            5.6         6.9772         6.9057         7.4839         6.7856         7.0182         6.9074         7.3333         7.1667
      std. dev.              1.0198         3.0725         3.7558         3.7401         3.1745          3.747         3.7758         3.6982         3.6742         3.7156
      weight sum                  5              5          10599          12493             93            513           1206             54             36              6
      precision                   1              1              1              1              1              1              1              1              1              1

    Farbe Karte 5
      Herz                      2.0            3.0         2698.0         3113.0           22.0          134.0          320.0           13.0           12.0            1.0
      Pik                       2.0            2.0         2686.0         3045.0           22.0          124.0          276.0           12.0           10.0            3.0
      Karo                      2.0            2.0         2653.0         3166.0           25.0          127.0          325.0           13.0           10.0            1.0
      Kreuz                     3.0            2.0         2566.0         3173.0           28.0          132.0          289.0           20.0            8.0            5.0
      [total]                   9.0            9.0        10603.0        12497.0           97.0          517.0         1210.0           58.0           40.0           10.0

    Wert Karte 5
      mean                        5            7.4         6.9914         6.9549         7.4301         6.6238         6.8939         7.0556         6.8611         9.3333
      std. dev.              4.9396         3.0067         3.7355         3.7419         3.2176         3.7708         3.8006         3.7585         3.6602         2.9814
      weight sum                  5              5          10599          12493             93            513           1206             54             36              6
      precision                   1              1              1              1              1              1              1              1              1              1



    Time taken to build model: 0.18 seconds

    === Evaluation on test set ===

    Time taken to test model on supplied test set: 4.55 seconds

    === Summary ===

    Correctly Classified Instances       50079               50.079  %
    Incorrectly Classified Instances     49921               49.921  %
    Kappa statistic                         -0.0002
    Mean absolute error                      0.1136
    Root mean squared error                  0.2384
    Relative absolute error                 99.9683 %
    Root relative squared error            100.0263 %
    Total Number of Instances           100000     

    === Detailed Accuracy By Class ===

                     TP Rate  FP Rate  Precision  Recall   F-Measure  MCC      ROC Area  PRC Area  Class
                     0,000    0,000    0,000      0,000    0,000      0,000    0,217     0,000     Royal Flush
                     0,000    0,000    0,000      0,000    0,000      0,000    0,784     0,000     Straight Flush
                     0,001    0,001    0,396      0,001    0,003      -0,002   0,499     0,419     Ein Paar
                     0,999    0,999    0,501      0,999    0,667      -0,004   0,508     0,510     Hoechste Karte
                     0,000    0,000    0,000      0,000    0,000      0,000    0,617     0,009     Strasse
                     0,000    0,000    0,000      0,000    0,000      0,000    0,485     0,027     Drilling
                     0,000    0,000    0,000      0,000    0,000      0,000    0,505     0,049     Zwei Paar
                     0,000    0,000    0,000      0,000    0,000      0,000    0,339     0,198     Flush
                     0,000    0,000    0,000      0,000    0,000      0,000    0,488     0,002     Full House
                     0,000    0,000    0,000      0,000    0,000      0,000    0,439     0,000     Vierling
    Weighted Avg.    0,501    0,501    0,418      0,501    0,335      -0,003   0,503     0,436     

    === Confusion Matrix ===

         a     b     c     d     e     f     g     h     i     j   <-- classified as
         0     0     0     1     0     0     0     0     0     0 |     a = Royal Flush
         0     0     0     1     0     0     0     0     0     0 |     b = Straight Flush
         0     0    53 42132     0     0     0     0     0     0 |     c = Ein Paar
         0     0    74 50026     0     0     0     0     0     0 |     d = Hoechste Karte
         0     0     0   379     0     0     0     0     0     0 |     e = Strasse
         0     0     2  2096     0     0     0     0     0     0 |     f = Drilling
         0     0     4  4869     0     0     0     0     0     0 |     g = Zwei Paar
         0     0     1   194     0     0     0     0     0     0 |     h = Flush
         0     0     0   150     0     0     0     0     0     0 |     i = Full House
         0     0     0    18     0     0     0     0     0     0 |     j = Vierling



#### c. DescisionTable

    === Run information ===

    Scheme:       weka.classifiers.rules.DecisionTable -X 1 -S "weka.attributeSelection.BestFirst -D 1 -N 5"
    Relation:     poker-hand-training-true
    Instances:    25010
    Attributes:   11
                  Farbe Karte 1
                  Wert Karte 1
                  Farbe Karte 2
                  Wert Karte 2
                  Farbe Karte 3
                  Wert Karte 3
                  Farbe Karte 4
                  Wert Karte 4
                  Farbe Karte 5
                  Wert Karte 5
                  Poker Hand
    Test mode:    user supplied test set:  size unknown (reading incrementally)

    === Classifier model (full training set) ===

    Decision Table:

    Number of training instances: 25010
    Number of Rules : 1
    Non matches covered by Majority class.
    	Best first.
    	Start set: no attributes
    	Search direction: forward
    	Stale search after 5 node expansions
    	Total number of subsets evaluated: 46
    	Merit of best subset found:   49.952
    Evaluation (for feature selection): CV (leave one out)
    Feature set: 11

    Time taken to build model: 1.14 seconds

    === Evaluation on test set ===

    Time taken to test model on supplied test set: 0.72 seconds

    === Summary ===

    Correctly Classified Instances       50100               50.1    %
    Incorrectly Classified Instances     49900               49.9    %
    Kappa statistic                          0     
    Mean absolute error                      0.1137
    Root mean squared error                  0.2384
    Relative absolute error                 99.997  %
    Root relative squared error            100      %
    Total Number of Instances           100000     

    === Detailed Accuracy By Class ===

                     TP Rate  FP Rate  Precision  Recall   F-Measure  MCC      ROC Area  PRC Area  Class
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,000     Royal Flush
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,000     Straight Flush
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,422     Ein Paar
                     1,000    1,000    0,501      1,000    0,668      0,000    0,500     0,501     Hoechste Karte
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,004     Strasse
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,021     Drilling
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,049     Zwei Paar
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,002     Flush
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,002     Full House
                     0,000    0,000    0,000      0,000    0,000      0,000    0,500     0,000     Vierling
    Weighted Avg.    0,501    0,501    0,251      0,501    0,334      0,000    0,500     0,432     

    === Confusion Matrix ===

         a     b     c     d     e     f     g     h     i     j   <-- classified as
         0     0     0     1     0     0     0     0     0     0 |     a = Royal Flush
         0     0     0     1     0     0     0     0     0     0 |     b = Straight Flush
         0     0     0 42185     0     0     0     0     0     0 |     c = Ein Paar
         0     0     0 50100     0     0     0     0     0     0 |     d = Hoechste Karte
         0     0     0   379     0     0     0     0     0     0 |     e = Strasse
         0     0     0  2098     0     0     0     0     0     0 |     f = Drilling
         0     0     0  4873     0     0     0     0     0     0 |     g = Zwei Paar
         0     0     0   195     0     0     0     0     0     0 |     h = Flush
         0     0     0   150     0     0     0     0     0     0 |     i = Full House
         0     0     0    18     0     0     0     0     0     0 |     j = Vierling



#### d. LADTree Algorithmus
