   M S B A M L   `   `   `  ����]  YMaintenance Process Control System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullW0clr-namespace:Maintenance_Process_Control_System"Maintenance_Process_Control_System  5   	   k:clr-namespace:Maintenance_Process_Control_System.ViewModel,Maintenance_Process_Control_System.ViewModel  5   	   a5clr-namespace:Maintenance_Process_Control_System.View'Maintenance_Process_Control_System.View  5	   	   1    +Maintenance_Process_Control_System.MainView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Blocal0clr-namespace:Maintenance_Process_Control_System     5   	   X TFontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5   	   J	viewModel:clr-namespace:Maintenance_Process_Control_System.ViewModel  5   	   Blocal15clr-namespace:Maintenance_Process_Control_System.View  5	   	   $	��700��5   	   $
��1300��6     � WindowStartupLocation$  CenterScreen=�5   	    � WindowStyle$
 None=�5   	   
������  � AllowsTransparency .  � DataContext 5      @   :Maintenance_Process_Control_System.ViewModel.MainViewModel  5   
    � 	Resources 5       �� DataTypeD   >Maintenance_Process_Control_System.ViewModel.CustomerViewModel:   4Maintenance_Process_Control_System.View.CustomerView��%G   (��       5      *, +)�� 6
   "  6   .R�5        5      5      .��5      ��  �� CornerRadius$ 12��6   $��1q�6   ��5   
   �� 5       �� 
StartPoint$	 0,0&�6"    �� EndPoint$	 1,1&�63   .��5      �    winBorderColor1	 � Color#	 [  6   
 � Offset$
 0Q�6H   � 5         winBorderColor2#	 [ 6   $

 0.75Q�6H   � 5!        winBorderColor3#	 [ 6   $
 1Q�6H   5"      ��5%   
   �� 5&      $	 0 0&�6"   $	 1 1&�63   .��5'      �   secondaryBackColor2#	 [ 6   $
 0Q�6L   � 5(        secondaryBackColor3#	 [ 6   $
 1Q�6L   5)      ._�5,   
   �  � ColumnDefinitions 5-      �� 5.      $	��190 �6#   �� 5/      $��* �6#   .+�53      �� $ 	10 0 0 10��6   $��0��6.   ���#ffffff._�55      ]� ��. .+�56      �� $��Bottom=�6!   $��Bottom=�6<   $��0 0 0 30q�6T   .+�58      �� 
������ 
�������$��0 0 0 1q�59   4   $��20 10 20 20q�5:      � 5<       5=      �� 5>   "   $��* �63   �� 5?   "   .+�5C      ��  �� Orientation$ 
Horizontal=�6)   $��0��6B   .+�5D   "   A� $��30��6*   $��30��66    
 color2#��[ 5E   &   $��2��5F   &   $��15,0,8,0q�5G   &   ��5H   &   �� 5I   *    �� ImageSource$ /Images/touxiang.jpg��65   5K   #   �� 5L   "     titleColor3#��[ 5M   (   $��
Montserrat)�5N   (   $��8(�5O   (   $��Center=�5P   (   ��5L   ,   �� * CurrentUserAccount.DisplayName+5P   (   5Q      �� 5T        
iconButton#��[ 6%     titleColor5
 � Tag# [ 5U   !   $��Right=�6D   $��1��5V   !   $��0 5 20 0q�61   .��5W   "   !  FontAwesome.Sharp.IconImage  �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$ SignOut=�6/    	 iconButtonIcon#��[	 6>   5X      5Y      5Z      �� 5^      .+�5`      �� $ 
Horizontal=�6%   $��35��6>   $��
15 25 0 20q�5a   !   .+�5b      �� $��30��6$   �� 5c      $��铁路机车卡控系统��6(   $
��Wrap=�5d   $    �� TextAlignment$ Center=�68   #��[ 5e   $   $��16(�5f   $   $��Black"�5g   $   $��Center=�5h   $   $��10 0 0 0q�5i   $   5j      �� 5l      
������ 
�������$��0 0 0 1q�5m   5   $��20 10 20 20q�5n      	� 5r       
 
menuButton#��[
 6&    
 color1# [ 6J    d� 	IsChecked$
 TrueY�5s   "   ��63   �� *ShowHomeViewCommand+.��5t      �� $ 
Horizontal=�6)   .+�5u   "     $
 Home=�6/     menuButtonIcon#��[ 6;   �� 5v   "   $��	Dashboard��6,     menuButtonText#��[ 6=   5w      5x      	� 5z      #��[
 6&   # [ 6J   ��5{   &   �� *ShowCustomerViewCommand+.��5|      �� $ 
Horizontal=�6)   .+�5}   "     $ 	UserGroup=�6/   #��[ 6@   �� 5~   "   $��	Customers��6,   #��[ 6=   5      5�      	� 5�      #��[
 6&    
 color3# [ 6J   .��5�      �� $ 
Horizontal=�6)   .+�5�   "     $
 Home=�6/   #��[ 6;   �� 5�   "   $��	Dashboard��6,   #��[ 6=   5�      5�      	� 5�      #��[
 6&    
 color4# [ 6J   .��5�      �� $ 
Horizontal=�6)   .+�5�   "     $
 Home=�6/   #��[ 6;   �� 5�   "   $��	Dashboard��6,   #��[ 6=   5�      5�      	� 5�      #��[
 6&    
 color5# [ 6J   .��5�      �� $ 
Horizontal=�6)   .+�5�   "     $
 Home=�6/   #��[ 6;   �� 5�   "   $��	Dashboard��6,   #��[ 6=   5�      5�      	� 5�      #��[
 6&    
 color6# [ 6J   .��5�      �� $ 
Horizontal=�6)   .+�5�   "     $
 Home=�6/   #��[ 6;   �� 5�   "   $��	Dashboard��6,   #��[ 6=   5�      5�      5�      5�      5�      �� 5�      $ 	0 10 10 0��6   $��1��6.   ._�5�      �  � RowDefinitions 5�      �� 5�      $��25 �6(   �� 5�      $��50 �6(   �� 5�      $��* �6(   .+�5�      �� -   5         ��Name$ pnlControlbar��5�   !   $ 
Horizontal=�68   $��RightToLeft=�5�   !   $��0��5�   !   
������ $��0 0 5 0q�5�   !   .+�5�      �� -   5         ��Name$ btnClose��5�   !     controlButton#��[ 63   # [ 5�   !   .��5�        $ Xmark=�6+     controlButtonIcon#��[ 68   5�      �� 5�      -   5        $ btnMaximize��5�   !   #��[ 66   # [ 5�   !   .��5�        $ Square=�6+   #��[ 69   5�      �� 5�      -   5        $ btnMinimize��5�   !   #��[ 66    
 color8# [ 5�   !   .��5�        $ WindowMinimize=�6+   $��12��6A   #��[ 6L   5�      5�      � 5�      $��1��6   $��	0 10 15 0q�6(    5�      �� 5�      �� 5�      .+�5�      �� $��0��6%   $ 
Horizontal=�5�   %   $��Center=�5�   %   .+�5�        $��20��5�   +   $��20��5�   +     titleColor2   
Foreground# [ 5�   +   $��	35,0,10,0q�5�   +    5�   +   �� *Icon+5�   +   �� 5�      #��[ 5�   (   $��16(�5�   (   $��
Montserrat)�5�   (   $��Medium"�5�   (   $��Center=�5�   (   ��5�   (   �� *	Caption+5�   (   5�      5�      �� 5�      $��2��5�   %   $��25q�5�   %   ��5�   %   �� *CurrentChildView+5�   %   5�      5�      5�      5�      5�      