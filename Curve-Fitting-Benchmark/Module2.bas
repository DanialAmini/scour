Attribute VB_Name = "Module2"
Const pi As Double = 3.14159265358979


Public Function func(x, i)
    '0<x<1
    If i = 1 Then
        f1 = (Sin(2 * pi * x ^ 3)) ^ 3
        temp = f1
    ElseIf i = 2 Then
        f2 = (4 * x - 2) + 2 * Exp(-16 * (4 * x - 2) ^ 2)
        temp = f2
    ElseIf i = 3 Then
        f3 = Sin(x) + 2 * Exp(-30 * x ^ 2)
        temp = f3
    ElseIf i = 4 Then
        f4 = Sin(2 * (4 * x - 2)) + 2 * Exp(-16 * (4 * x - 2) ^ 2)
        temp = f4
    ElseIf i = 5 Then
        f5 = 10 * (4 * x - 2) / (1 + 100 * (4 * x - 2) ^ 2)
        temp = f5
    End If
    func = temp
End Function
Public Function tanh(x)
    tanh = WorksheetFunction.tanh(x)

End Function

Public Function func1_(x, method_)
    If method_ = "ANN" Then
    
        temp = 0.887620959088543
        temp = temp + -30.6171355214743 * tanh(-8.33619888685864 + 10.0003796780496 * x)
        temp = temp + -106.861127633233 * tanh(6.45740708027399 + -8.23376981265305 * x)
        temp = temp + -75.3389019533051 * tanh(-6.68999277342273 + 8.78461893961759 * x)

    ElseIf method_ = "sum of ABS" Then
    
        temp = -15.1763492618253
        temp = temp + 15.3175143143326 * Abs(x - -4.17363670305941E-04)
        temp = temp + 2.44075489463098 * Abs(x - 0.430233262418731)
        temp = temp + -6.9844930569473 * Abs(x - 0.640074214325004)
        temp = temp + 3.86754213602082 * Abs(x - 0.757590666836508)
        temp = temp + -6.20475079886469 * Abs(x - 0.830854693670268)
        temp = temp + 13.5866153800005 * Abs(x - 0.906872274479855)
        temp = temp + 8.47682113555633 * Abs(x - 1.00000002673643)

    ElseIf method_ = "ANFIS" Then
    
        sigma = 0.107068659261381
        
        w1 = Exp(-1 * (x - 0.581253389204796) ^ 2 / sigma ^ 2)
        w2 = Exp(-1 * (x - 0.706579925035367) ^ 2 / sigma ^ 2)
        w3 = Exp(-1 * (x - 1.03258283805979) ^ 2 / sigma ^ 2)
            
        f1 = 1.61938446924902E-02 + -0.233151787204574 * x + 0.535516875999338 * x ^ 2
        f2 = 57.3699659048382 + -145.885781933919 * x + 92.7545223582048 * x ^ 2
        f3 = -24.1518948877975 + 34.2119114290541 * x + -9.86657841859564 * x ^ 2
                
        temp = (w1 * f1 + w2 * f2 + w3 * f3) / (w1 + w2 + w3)
        
    ElseIf method_ = "RBF" Then
    
        sigma = 5.23874220150719E-02
        temp = 0.019730835510059
        temp = temp + 0.358905927351521 * Exp(-1 * (x - 0.511221048297179) ^ 2 / sigma ^ 2)
        temp = temp + 0.801400362253218 * Exp(-1 * (x - 0.595444478693819) ^ 2 / sigma ^ 2)
        temp = temp + 0.760516960468365 * Exp(-1 * (x - 0.670027317050898) ^ 2 / sigma ^ 2)
        temp = temp + -1.00736296248709 * Exp(-1 * (x - 0.906367947560964) ^ 2 / sigma ^ 2)

    
    ElseIf method_ = "regression" Then
    
        temp = -0.217703745266695
        temp = temp + 6.09826332758047 * x ^ 1
        temp = temp + -32.1810147943138 * x ^ 2
        temp = temp + -0.25720697390042 * x ^ 3
        temp = temp + 269.288951269002 * x ^ 4
        temp = temp + -469.598811513804 * x ^ 5
        temp = temp + 227.312776309794 * x ^ 6
    
    End If
    
    func1_ = temp
    
End Function



