   M S B A M L   `   `   `  ����]  YMaintenance Process Control System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nulla5clr-namespace:Maintenance_Process_Control_System.View'Maintenance_Process_Control_System.View  5   	   k:clr-namespace:Maintenance_Process_Control_System.ViewModel,Maintenance_Process_Control_System.ViewModel  5   	   7    1Maintenance_Process_Control_System.View.LoginView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Glocal5clr-namespace:Maintenance_Process_Control_System.View     5   	   X TFontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5   	   J	viewModel:clr-namespace:Maintenance_Process_Control_System.ViewModel  5   	   -   5        $	��550��5
   	   $	��800��6   
������   � AllowsTransparency  .  � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�6    � WindowStartupLocation$ CenterScreen=�5   	    � DataContext 5      A   ;Maintenance_Process_Control_System.ViewModel.LoginViewModel  5   
   .��5      ��  �� CornerRadius$ 12��6   ��5   
   �� 5       �� ImageSource$ /Images/train.jpg��6    j� Stretch$
 None=�69   ._�5   
   �� $ 12��6   $��1q�6#    J� Opacity$
 0.85Q�67   ��5      �� 5      	 �� 
StartPoint$		 0,0&�6&   
 �� EndPoint$	
 1,1&�67   .��5      �    winBorderColor1 � Color# [  6#    � Offset$ 0Q�6L   � 5         winBorderColor2# [ 6#   $
 0.75Q�6L   � 5!        winBorderColor3# [ 6#   $ 1Q�6L   5"      ��5%      �� 5&      $		 1,0&�6&   $	
 0,1&�67   .��5'      �   primaryBackColor3# [ 6#   $ 0Q�6N   � 5(        primaryBackColor4# [ 6#   $	 1.2Q�6N   5)      ._�5,      �  � RowDefinitions 5-      �� 5.      $��30 �6$   �� 5/      .+�53      �  � ColumnDefinitions 54      �� 55      $��* �6+   �� 56      $��80 �6+   �� 57      $��5 �6+   .+�5:      �� -   5         ��Name$ pnlControlbar��5:   !    �� Orientation$ 
Horizontal=�68   $��RightToLeft=�5;   !   $��1��5<   !   
������ .+�5?      �� -   5         ��Name$ btnClose��5?   !     controlButton#��[ 63    
 color4
 � Tag# [ 5@   !   .��5B      !  FontAwesome.Sharp.IconImage  �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$ Xmark=�6+   # [ 68     controlButtonIcon#��[ 6V   5C      �� 5D      -   5        $ btnMinimize��5D   !   #��[ 66    
 color3# [ 5E   !   .��5G        $ WindowMinimize=�6+    
	 color8# [	 6A   $��12��6_   #��[ 6k   5H      5I      5L      �� 5O      $��1��6   $	��350��6*   $ Vertical=�5P      $��0 35 0 0q�5Q      .+�5T      �� $	��100��6   $	��100��6(   �� 5V      $��Track Master��6    
�������$��25(�5X       $��Black"�5Y       $��Center=�5Z       �� 5^      $��	用户名��6    
�������$��15(�5`       $��Black"�5a       $��	50 60 0 0q�5b       �� 5c      
�������$��0 0 0 1q�5d      $��28��5e      $	��250��5f      $��Center=�5g      $��0 10 0 0q�5h      ._�5j      �  5k      �� 5m   "   $
��Auto �63   �� 5o   "   $��* �63   .+�5s        $ UserAlt=�6+   $��0��5t   )      
Foreground
 �����$��Center=�5v   )   $��18��5w   )   $��12 0 8 0q�5x   )   $	 0.8Q�5y   )   �� 5|      -   5         ��Name$ txtUser��5|   &   $��1��5}   %   $��14(�5~   %   $��Medium"�5   %   $��
Montserrat)�5�   %   
������� �� 
CaretBrush
 �����$��0q�5�   %   
������ $��Stretch=�5�   %   $��Center=�5�   %   $��0 0 10 0q�5�   %   ��5�   %   �� *	Account+ �� UpdateSourceTrigger$ PropertyChanged=�.��6c   .��5�   1   ��5�   "   �� 5�   &    �� 
TargetType" ��6,   .�5�   *   ��  �� Property � �� �� Value
 ���� 6H    �� Triggers 5�   *   P� 5�   .    P� Property �@J�IsMouseOver P� Value . . �5�   2   ��  � �� �	#A0FFFFFF6P   5�   /   P� 5�   .    �@J�	IsFocused . . �5�   2   ��  � �� 

 color1# [
 6P   5�   /   5�   '   .��5�   1   5�      5�      5�      �� 5�      $��密  码��6    
�������$��15(�5�       $��Black"�5�       $��	50 15 0 0q�5�       �� 5�      
�������$��0 0 0 1q�5�   	   $��28��5�   	   $	��250��5�   	   $��Center=�5�   	   $��0 10 0 0q�5�   	   ._�5�      �  5�      �� 5�   "   $
��Auto �63   �� 5�   "   $��* �63   .+�5�        $
 Lock=�6+   $��0��5�      
 �����$��Center=�5�      $��18��5�      $��12 0 8 0q�5�      $	 0.8Q�5�      G� 5�      -   5         G�Name$ txtPass��5�   *   $��1��5�      $
��13.5(�5�      $��Medium"�5�      $��
Montserrat)�5�      
������� G� 
CaretBrush
 �����$��0q�5�      
������ $��Stretch=�5�      $��Center=�5�      $��0 0 10 0q�5�      ?   9Maintenance_Process_Control_System.View.PasswordBoxHelper    BindPassword  . !   BoundPassword! 5�      �� *Pwd+" �� Mode$" TwoWay=���5�   "   �� 5�   &   " G�6,   .�5�   *   ��  � ��
 ���� 6H    5�   *   P� 5�   .    �@J�IsMouseOver . . �5�   2   ��  � �� �	#A0FFFFFF6P   5�   /   P� 5�   .    �@J�	IsFocused . . �5�   2   ��  � ��# [
 6P   5�   /   5�   '   5�      5�      5�      �� 5�      
���  ��$��	50 10 0 0q�5�       $��12(�5�       ��5�       �� *ErrorMessage+5�       �� 5�      -   5        $ btnLogin��5�      $��0q�5�      
�������$��登  录��5�   0   $��16(�5�      $��
Montserrat)�5�      # � Cursor$
# Hand��5�      $��0 30 0 0q�5�      ��5�      �� *LoginCommand+��5�      �� 5�      " ��6$   .�5�   "   ��  � �� �#4569C96?   �� 5�   "    �@�Cursor$
 Hand��6;    5�   "   P� 5�   &    �@J�IsMouseOver . . �5�   *   ��  � �� �#5873C36G   5�   '   5�      ��5�      �� 5�      $ �� 
TargetType"$ ��6.   .R�5�   "   �� $	��150��6)   $��40��65   $ 20��5�   )   #��z��5�   )   ._�5�   &   �� $��Center=�67   $��Center=�6R   5�   #   5      5     5     5     5	     5     5     