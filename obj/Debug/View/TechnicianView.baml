   M S B A M L   `   `   `  ����]  YMaintenance Process Control System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullW0clr-namespace:Maintenance_Process_Control_System"Maintenance_Process_Control_System  5   	   a5clr-namespace:Maintenance_Process_Control_System.View'Maintenance_Process_Control_System.View  5   	   k:clr-namespace:Maintenance_Process_Control_System.ChildView,Maintenance_Process_Control_System.ChildView  5	   	   k:clr-namespace:Maintenance_Process_Control_System.ViewModel,Maintenance_Process_Control_System.ViewModel  5
   	   u?clr-namespace:Maintenance_Process_Control_System.ChildViewModel1Maintenance_Process_Control_System.ChildViewModel  5   	   7    1Maintenance_Process_Control_System.TechnicianView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Blocal0clr-namespace:Maintenance_Process_Control_System     5   	   X TFontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5   	   Blocal15clr-namespace:Maintenance_Process_Control_System.View  5   	   Glocal2:clr-namespace:Maintenance_Process_Control_System.ChildView  5	   	   J	viewModel:clr-namespace:Maintenance_Process_Control_System.ViewModel  5
   	   P
viewModel2?clr-namespace:Maintenance_Process_Control_System.ChildViewModel  5   	   $	��700��5   	   $
��1300��6     � WindowStartupLocation$  CenterScreen=�5   	    � WindowStyle$
 None=�5   	   
������  � AllowsTransparency .  � DataContext 5      F   @Maintenance_Process_Control_System.ViewModel.TechnicianViewModel  5   
    � 	Resources 5       �� DataTypeH   BMaintenance_Process_Control_System.ChildViewModel.techCarViewModel>   8Maintenance_Process_Control_System.ChildView.techCarViewJ   DMaintenance_Process_Control_System.ChildViewModel.techEnterViewModel@   :Maintenance_Process_Control_System.ChildView.techEnterViewJ   DMaintenance_Process_Control_System.ChildViewModel.techFaultViewModel@   :Maintenance_Process_Control_System.ChildView.techFaultView��%�   (��       5      *, +)(�� 2     5      *, +)(�� d     5      *, +)�� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5      �� 5   
   "  6   .R�5        5       5"      .��5$      ��  �� CornerRadius$ 12��6   $��1q�6   ��5%   
   �� 5&       �� 
StartPoint$	 0,0&�6"    �� EndPoint$	 1,1&�63   .��5'      �    winBorderColor1	 � Color#	 [  6   
 � Offset$
 0Q�6H   � 5(        winBorderColor2#	 [ 6   $

 0.75Q�6H   � 5)        winBorderColor3#	 [ 6   $
 1Q�6H   5*      ��5-   
   �� 5.      $	 0 0&�6"   $	 1 1&�63   .��5/      �   secondaryBackColor2#	 [ 6   $
 0Q�6L   � 50        secondaryBackColor3#	 [ 6   $
 1Q�6L   51      ._�54   
   �  � ColumnDefinitions 55      �� 56      $	��190 �6#   �� 57      $��* �6#   .+�5;      �� $ 	10 0 0 10��6   $��0��6.   ���#ffffff._�5=      ]� ��. .+�5>      �� $��Bottom=�6!   $��Bottom=�6<   $��0 0 0 30q�6T   .+�5@      �� 
������ 
�������$��0 0 0 1q�5A   4   $��20 10 20 20q�5B      � 5D       5E      �� 5F   "   $
��auto �63   �� 5G   "   .+�5K      ��  �� Orientation$ 
Horizontal=�6)   $��0��6B   $��Center=�6R   .+�5L   "   A� $��30��6*   $��30��66    
 color2#��[ 5M   &   $��2��5N   &   $��15,0,8,0q�5O   &   ��5P   &   �� 5Q   *    �� ImageSource$ /Images/touxiang.jpg��65   5S   #   �� 5T   "     titleColor3#��[ 5U   (   $��
Montserrat)�5V   (   $��16(�5W   (   $��Center=�5X   (   ��5T   ,   �� *CurrentUserAccount+ �� Mode$ OneWay=�5X   (   5Y      �� 5\        
iconButton#��[ 6%     titleColor5
 � Tag# [ 5]   !   $��Right=�6D   $��1��5^   !   $��0 5 20 0q�61   ��6C   �� *ExitCommand+.��5_   "   !  FontAwesome.Sharp.IconImage  �	  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]] 	  Icon$ SignOut=�6/    	 iconButtonIcon#��[	 6>   5`      5a      5b      �� 5f      .+�5h      �� $ 
Horizontal=�6%   $��35��6>   $��Center=�6J   $��	15 25 0 0q�5i   !   .+�5j      �� $��T��6(    �� TextAlignment$ Center=�5k   $    

 color5#��[
 5l   $   $��25(�5m   $   $��Black"�5n   $   $��Center=�5o   $   $��0 0 0 6q�5p   $   �� 5q      $��
rackMaster��6(   $
��Wrap=�5r   $   $ Center=�68   #��[ 5s   $   $��13(�5t   $   $��Black"�5u   $   $��Center=�5v   $   5w      �� 5x      $��	技术组��6$   $
��Wrap=�5y   $   $ Center=�68   #��[ 5z   $   $��12(�5{   $   $��Black"�5|   $   $��Center=�5}   $   �� 5      
������ 
�������$��0 0 0 1q�5�   5   $��20 10 20 20q�5�      	� 5�        
menuButton#��[ 6&    
 color1# [ 6J    d� 	IsChecked$
 TrueY�5�   "   ��63   �� *ShowHomeViewCommand+.��5�      �� $ 
Horizontal=�6)   .+�5�   "     $ Subway=�6/     menuButtonIcon#��[ 6=   �� 5�   "   $��机车信息��6,     menuButtonText#��[ 68   5�      5�      	� 5�      #��[ 6&   # [ 6J   ��5�   &   �� *ShowCustomerViewCommand+.��5�      �� $ 
Horizontal=�6)   .+�5�   "     $ Indent=�6/   #��[ 6=   �� 5�   "   $��机车入库��6,   #��[ 68   5�      5�      	� 5�      #��[ 6&    
 color3# [ 6J   ��5�   &   �� *ShowUserViewCommand+.��5�      �� $ 
Horizontal=�6)   .+�5�   "     $ WindowRestore=�6/   #��[ 6D   �� 5�   "   $��故障分解��6,   #��[ 68   5�      5�      5�      5�      5�      �� 5�      $ 	0 10 10 0��6   $��1��6.   ._�5�      �  � RowDefinitions 5�      �� 5�      $��15 �6(   �� 5�      $��* �6(   .+�5�      �� -   5         ��Name$ pnlControlbar��5�   !   $ 
Horizontal=�68   $��RightToLeft=�5�   !   $��0��5�   !   
������ $��0 0 5 0q�5�   !   .+�5�      �� -   5         ��Name$ btnClose��5�   !     controlButton#��[ 63    
 color4# [ 5�   !   .��5�        $ Xmark=�6+     controlButtonIcon#��[ 68   5�      �� 5�      -   5        $ btnMaximize��5�   !   #��[ 66    
 color6# [ 5�   !   .��5�        $ Square=�6+   #��[ 69   5�      �� 5�      -   5        $ btnMinimize��5�   !   #��[ 66    
 color8# [ 5�   !   .��5�        $ WindowMinimize=�6+   $��12��6A   #��[ 6L   5�      5�      �� 5�      $��2��5�   %   $��25q�5�   %   ��5�   %   �� *CurrentChildView+5�   %   5�      5�      5�      5�      5�      