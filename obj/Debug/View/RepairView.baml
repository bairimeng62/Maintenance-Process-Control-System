   M S B A M L   `   `   `  ����]  YMaintenance Process Control System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullW0clr-namespace:Maintenance_Process_Control_System"Maintenance_Process_Control_System  5   	   a5clr-namespace:Maintenance_Process_Control_System.View'Maintenance_Process_Control_System.View  5   	   k:clr-namespace:Maintenance_Process_Control_System.ChildView,Maintenance_Process_Control_System.ChildView  5	   	   k:clr-namespace:Maintenance_Process_Control_System.ViewModel,Maintenance_Process_Control_System.ViewModel  5
   	   u?clr-namespace:Maintenance_Process_Control_System.ChildViewModel1Maintenance_Process_Control_System.ChildViewModel  5   	   3    -Maintenance_Process_Control_System.RepairView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Blocal0clr-namespace:Maintenance_Process_Control_System     5   	   X TFontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5   	   Blocal15clr-namespace:Maintenance_Process_Control_System.View  5   	   Glocal2:clr-namespace:Maintenance_Process_Control_System.ChildView  5	   	   K
viewModel1:clr-namespace:Maintenance_Process_Control_System.ViewModel  5
   	   P
viewModel2?clr-namespace:Maintenance_Process_Control_System.ChildViewModel  5   	   $	��700��5   	   $
��1300��6     � WindowStartupLocation$  CenterScreen=�5   	    � WindowStyle$
 None=�5   	   
������  � AllowsTransparency .  � DataContext 5      B   <Maintenance_Process_Control_System.ViewModel.RepairViewModel  5   
    � 	Resources 5       �� DataTypeM   GMaintenance_Process_Control_System.ChildViewModel.repairTargetViewModelC   =Maintenance_Process_Control_System.ChildView.repairTargetView��%G   (��       5      *, +)�� 6
   "  6   .R�5        5      5      .��5      ��  �� CornerRadius$ 12��6   $��1q�6   ��5   
   �� 5       �� 
StartPoint$	 0,0&�6"    �� EndPoint$	 1,1&�63   .��5       �    winBorderColor1	 � Color#	 [  6   
 � Offset$
 0Q�6H   � 5!        winBorderColor2#	 [ 6   $

 0.75Q�6H   � 5"        winBorderColor3#	 [ 6   $
 1Q�6H   5#      ��5&   
   �� 5'      $	 0 0&�6"   $	 1 1&�63   .��5(      �   secondaryBackColor2#	 [ 6   $
 0Q�6L   � 5)        secondaryBackColor3#	 [ 6   $
 1Q�6L   5*      ._�5-   
   �  � ColumnDefinitions 5.      �� 5/      $	��190 �6#   �� 50      $��* �6#   .+�54      �� $ 	10 0 0 10��6   $��0��6.   ���#ffffff._�56      ]� ��. .+�57      �� $��Bottom=�6!   $��Bottom=�6<   $��0 0 0 30q�6T   .+�59      �� 
������ 
�������$��0 0 0 1q�5:   4   $��20 10 20 20q�5;      � 5=       5>      �� 5?   "   $
��auto �63   �� 5@   "   .+�5D      ��  �� Orientation$ 
Horizontal=�6)   $��0��6B   .+�5E   "   A� $��30��6*   $��30��66    
 color2#��[ 5F   &   $��2��5G   &   $��15,0,8,0q�5H   &   ��5I   &   �� 5J   *    �� ImageSource$ /Images/touxiang.jpg��65   5L   #   �� 5M   "     titleColor3#��[ 5N   (   $��
Montserrat)�5O   (   $��16(�5P   (   $��Center=�5Q   (   ��5M   ,   �� *CurrentUserAccount+5Q   (   5R      �� 5U        
iconButton#��[ 6%     titleColor5
 � Tag# [ 5V   !   $��Right=�6D   $��1��5W   !   $��0 5 20 0q�61   ��6C   �� *ExitCommand+.��5X   "   !  FontAwesome.Sharp.IconImage  �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$ SignOut=�6/    	 iconButtonIcon#��[	 6>   5Y      5Z      5[      �� 5_      .+�5a      �� $ 
Horizontal=�6%   $��40��6>   $��Center=�6J   $��	15 25 0 0q�5b   !   .+�5c      �� $��T��6(    �� TextAlignment$ Center=�5d   $    

 color5#��[
 5e   $   $��25(�5f   $   $��Black"�5g   $   $��Center=�5h   $   $��0 0 0 6q�5i   $   �� 5j      $��
rackMaster��6(   $
��Wrap=�5k   $   $ Center=�68   #��[ 5l   $   $��13(�5m   $   $��Black"�5n   $   $��Center=�5o   $   5p      �� 5q      $��	检修组��6$   $
��Wrap=�5r   $   $ Center=�68   #��[ 5s   $   $��12(�5t   $   $��Black"�5u   $   $��Center=�5v   $   �� 5x      
������ 
�������$��0 0 0 1q�5y   5   $��20 10 20 20q�5z      	� 5        
menuButton#��[ 6&   # [ 6J   ��5�   &   �� *ShowCustomerViewCommand+.��5�      �� $ 
Horizontal=�6)   .+�5�   "     $ Table=�6/     menuButtonIcon#��[ 6<   �� 5�   "   $��代办任务��6,     menuButtonText#��[ 68   5�      5�      5�      5�      5�      �� 5�      $ 	0 10 10 0��6   $��1��6.   ._�5�      �  � RowDefinitions 5�      �� 5�      $��15 �6(   �� 5�      $��* �6(   .+�5�      �� -   5         ��Name$ pnlControlbar��5�   !   $ 
Horizontal=�68   $��RightToLeft=�5�   !   $��0��5�   !   
������ $��0 0 5 0q�5�   !   .+�5�      �� -   5         ��Name$ btnClose��5�   !     controlButton#��[ 63    
 color4# [ 5�   !   .��5�        $ Xmark=�6+     controlButtonIcon#��[ 68   5�      �� 5�      -   5        $ btnMaximize��5�   !   #��[ 66    
 color6# [ 5�   !   .��5�        $ Square=�6+   #��[ 69   5�      �� 5�      -   5        $ btnMinimize��5�   !   #��[ 66    
 color8# [ 5�   !   .��5�        $ WindowMinimize=�6+   $��12��6A   #��[ 6L   5�      5�      �� 5�      $��2��5�   %   $��25q�5�   %   ��5�   %   �� *CurrentChildView+5�   %   5�      5�      5�      5�      5�      