   M S B A M L   `   `   `  ����]  YMaintenance Process Control System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullW0clr-namespace:Maintenance_Process_Control_System"Maintenance_Process_Control_System  5   	   a5clr-namespace:Maintenance_Process_Control_System.View'Maintenance_Process_Control_System.View  5   	   k:clr-namespace:Maintenance_Process_Control_System.ChildView,Maintenance_Process_Control_System.ChildView  5	   	   k:clr-namespace:Maintenance_Process_Control_System.ViewModel,Maintenance_Process_Control_System.ViewModel  5
   	   u?clr-namespace:Maintenance_Process_Control_System.ChildViewModel1Maintenance_Process_Control_System.ChildViewModel  5   	   4    .Maintenance_Process_Control_System.ManagerView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Blocal0clr-namespace:Maintenance_Process_Control_System     5   	   X TFontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5   	   Blocal15clr-namespace:Maintenance_Process_Control_System.View  5   	   Glocal2:clr-namespace:Maintenance_Process_Control_System.ChildView  5	   	   J	viewModel:clr-namespace:Maintenance_Process_Control_System.ViewModel  5
   	   P
viewModel2?clr-namespace:Maintenance_Process_Control_System.ChildViewModel  5   	   $	��700��5   	   $
��1300��6     � WindowStartupLocation$  CenterScreen=�5   	    � WindowStyle$
 None=�5   	   
������  � AllowsTransparency .  � DataContext 5      C   =Maintenance_Process_Control_System.ViewModel.ManagerViewModel  5   
    � 	Resources 5       �� DataTypeD   >Maintenance_Process_Control_System.ViewModel.CustomerViewModel:   4Maintenance_Process_Control_System.View.CustomerViewJ   DMaintenance_Process_Control_System.ChildViewModel.manageCarViewModel;   5Maintenance_Process_Control_System.View.manageCarViewO   IMaintenance_Process_Control_System.ChildViewModel.manageOverhaulViewModelE   ?Maintenance_Process_Control_System.ChildView.manageOverhaulViewK   EMaintenance_Process_Control_System.ChildViewModel.manageUserViewModelA	   ;Maintenance_Process_Control_System.ChildView.manageUserView��%,  (��       5      *, +)(�� 2     5      *, +)(�� d     5      *, +)(�� �     5!      *, +)�� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5       �� 5!   
   "  6   .R�5"      	  5#      5$      .��5&      ��  �� CornerRadius$ 12��6   $��1q�6   ��5'   
   �� 5(       �� 
StartPoint$	 0,0&�6"    �� EndPoint$	 1,1&�63   .��5)      �    winBorderColor1	 � Color#	 [  6   
 � Offset$
 0Q�6H   � 5*        winBorderColor2#	 [ 6   $

 0.75Q�6H   � 5+        winBorderColor3#	 [ 6   $
 1Q�6H   5,      ��5/   
   �� 50      $	 0 0&�6"   $	 1 1&�63   .��51      �   secondaryBackColor2#	 [ 6   $
 0Q�6L   � 52        secondaryBackColor3#	 [ 6   $
 1Q�6L   53      ._�56   
   �  � ColumnDefinitions 57      �� 58      $	��190 �6#   �� 59      $��* �6#   .+�5=      �� $ 	10 0 0 10��6   $��0��6.   ���#ffffff._�5?      ]� ��. .+�5@      �� $��Bottom=�6!   $��Bottom=�6<   $��0 0 0 30q�6T   .+�5B      �� 
������ 
�������$��0 0 0 1q�5C   4   $��20 10 20 20q�5D      � 5F       5G      �� 5H   "   $
��auto �63   �� 5I   "   .+�5M      ��  �� Orientation$ 
Horizontal=�6)   $��0��6B   .+�5N   "   A� $��30��6*   $��30��66    
 color2#��[ 5O   &   $��2��5P   &   $��15,0,8,0q�5Q   &   ��5R   &   �� 5S   *    �� ImageSource$ /Images/touxiang.jpg��65   5U   #   �� 5V   "     titleColor3#��[ 5W   (   $��
Montserrat)�5X   (   $��16(�5Y   (   $��Center=�5Z   (   ��5V   ,   �� *CurrentUserAccount+5Z   (   5[      �� 5^        
iconButton#��[ 6%     titleColor5
 � Tag# [ 5_   !   $��Right=�6D   $��1��5`   !   $��0 5 20 0q�61   ��6C   �� *ExitCommand+.��5a   "   !
  FontAwesome.Sharp.IconImage
  �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$ SignOut=�6/    	 iconButtonIcon#��[	 6>   5b      5c      5d      �� 5h      .+�5j      �� $ 
Horizontal=�6%   $��35��6>   $��Center=�6J   $��	15 25 0 0q�5k   !   .+�5l      �� $��T��6(    �� TextAlignment$ Center=�5m   $    

 color5#��[
 5n   $   $��25(�5o   $   $��Black"�5p   $   $��Center=�5q   $   $��0 0 0 6q�5r   $   �� 5s      $��
rackMaster��6(   $
��Wrap=�5t   $   $ Center=�68   #��[ 5u   $   $��13(�5v   $   $��Black"�5w   $   $��Center=�5x   $   5y      �� 5z      $��	管理组��6$   $
��Wrap=�5{   $   $ Center=�68   #��[ 5|   $   $��12(�5}   $   $��Black"�5~   $   $��Center=�5   $   �� 5�      
������ 
�������$��0 0 0 1q�5�   5   $��20 10 20 20q�5�      	� 5�        
menuButton#��[ 6&    
 color1# [ 6J    d� 	IsChecked$
 TrueY�5�   "   ��63   �� *ShowHomeViewCommand+.��5�      �� $ 
Horizontal=�6)   .+�5�   "   
  $ Subway=�6/     menuButtonIcon#��[ 6=   �� 5�   "   $��机车信息��6,     menuButtonText#��[ 68   5�      5�      	� 5�      #��[ 6&   # [ 6J   ��5�   &   �� *ShowCustomerViewCommand+.��5�      �� $ 
Horizontal=�6)   .+�5�   "   
  $ Wrench=�6/   #��[ 6=   �� 5�   "   $��检修信息��6,   #��[ 68   5�      5�      	� 5�      #��[ 6&    
 color3# [ 6J   ��5�   &   �� *ShowUserViewCommand+.��5�      �� $ 
Horizontal=�6)   .+�5�   "   
  $ 	UserGroup=�6/   #��[ 6@   �� 5�   "   $��人员信息��6,   #��[ 68   5�      5�      5�      5�      5�      �� 5�      $ 	0 10 10 0��6   $��1��6.   ._�5�      �  � RowDefinitions 5�      �� 5�      $��15 �6(   �� 5�      $��* �6(   .+�5�      �� -   5         ��Name$ pnlControlbar��5�   !   $ 
Horizontal=�68   $��RightToLeft=�5�   !   $��0��5�   !   
������ $��0 0 5 0q�5�   !   .+�5�      �� -   5         ��Name$ btnClose��5�   !     controlButton#��[ 63    
 color4# [ 5�   !   .��5�      
  $ Xmark=�6+     controlButtonIcon#��[ 68   5�      �� 5�      -   5        $ btnMaximize��5�   !   #��[ 66    
 color6# [ 5�   !   .��5�      
  $ Square=�6+   #��[ 69   5�      �� 5�      -   5        $ btnMinimize��5�   !   #��[ 66    
 color8# [ 5�   !   .��5�      
  $ WindowMinimize=�6+   $��12��6A   #��[ 6L   5�      5�      �� 5�      $��2��5�   %   $��25q�5�   %   ��5�   %   �� *CurrentChildView+5�   %   5�      5�      5�      5�      5�      