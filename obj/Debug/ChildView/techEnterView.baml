   M S B A M L   `   `   `  ����]  YMaintenance Process Control System, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullk:clr-namespace:Maintenance_Process_Control_System.ChildView,Maintenance_Process_Control_System.ChildView  5      @    :Maintenance_Process_Control_System.ChildView.techEnterView   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      X TFontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10fFfa=http://schemas.awesome.incremented/wpf/xaml/fontawesome.sharp  5      Flocal:clr-namespace:Maintenance_Process_Control_System.ChildView  5      .��5
      �   � RowDefinitions  5   
   �� 5      $��30 �6   �� 5      .+�5   
   � $��0��6    � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $	��340 �6#   .+�5      �� $��0��6    �� Orientation$ 
Horizontal=�5      $	��Top=�5      .+�5      !  FontAwesome.Sharp.IconImage  �  �FontAwesome.Sharp.IconImageBase`1[[FontAwesome.Sharp.IconChar, FontAwesome.Sharp, Version=6.6.0.0, Culture=neutral, PublicKeyToken=d16d1e4e568ec10f]]   Icon$ Indent=�6   $��18��5      $��18��5         titleColor5   
Foreground# [  5       $��
10,10,10,0q�5!      �� 5#      $��机车入库��6   #��[  5$      $��14(�5%      $��Black"�5&      $��0,10,0,0q�5'      5(      5)      �� 5,   
   $��1��6   ���#FFFFFF �� CornerRadius$ 10��5.       �� Padding$ 10q�5/      $��0 20 0 0q�50      ._�52      � $	��750��6   $��0 50 0 0q�6   $��Center=�61     53      �� 54      $��70 �6$   �� 55      $��70 �6$   �� 56      $��70 �6$   �� 57      $��* �6$    5:      �� 5;      $��* �6'   �� 5<      $��* �6'   .+�5@      �� $��0��6   $��0��6*   $ 
Horizontal=�6:   $
��Left=�6S   .+�5B      �� $��车型:��6    ���#1D1D1F$��14(�6A   $��Black"�6O   $��0,0,48,0q�6b   $��Center=�6t   �� 5C        ComboBoxstyle#��[ 6    ��5D   !   �� *VehicleModels+ �� SelectedItem 5E       �� *SelectedModel+5F      �� 5I      $��0��6   $��1��6*   $ 
Horizontal=�6:   $
��Left=�6S   .+�5J      �� $��机车编号:��6    ���#1D1D1F$��14(�6B   $��Black"�6P   $��0,0,10,0q�6c   $��Center=�6u   �� 5K        TextBoxstyle#��[ 6   ��6D   �� *Number+5L      �� 5O      $��1��6   $��0��6*   $ 
Horizontal=�6:   $
��Left=�6S   .+�5P      �� $��车种:��6    ���#1D1D1F$��14(�6@   $��Black"�6N   $��0,0,48,0q�6a   $��Center=�6s   �� 5Q      #��[ 6   ��5R   !   �� *VehicleTypes+ �� SelectedValue 5S      �� *SelectedType+5T      �� 5W      $��1��6   $��1��6*   $ 
Horizontal=�6:   $
��Left=�6S   .+�5X      �� $��
配属段:��6    ���#1D1D1F$��14(�6A   $��Black"�6O   $��0,0,24,0q�6b   $��Center=�6t   �� 5Y      #��[ 5Z      ��5Y      �� *BelongingSection+5Z      5[      �� 5^      $��2��6   $��0��6*   $ 
Horizontal=�6:   $
��Left=�6S   .+�5_      �� $��入库日期:��6    ���#1D1D1F$��14(�6B   $��Black"�6P   $��0,0,20,0q�6c   $��Center=�6u   (  "System.Windows.Controls.DatePicker  5`        DatePickerStyle1#��[ 6!   $��Center=�5a   D   	   SelectedDate	 6!   �� *	EntryDate+6D   5b      �� 5e      $��2��6   $��1��6*   $ 
Horizontal=�6:   $
��Left=�6S   .+�5f      �� $��交接人员:��6    ���#1D1D1F$��14(�6B   $��Black"�6P   $��0,0,10,0q�6c   $��Center=�6u   �� 5g      #��[ 6   
 �� 
IsReadOnly
 . ���#86868B��5h      �� *CurrentUserName+ �� Mode$ OneWay=�5j      5k      �� 5n      $��3��6   $��1��6*   .+�5o      �� $��入库��5p        SubmitButton#��[ 5q      $��Right=�5r      $��
0,20,105,0q�5t      ��5s      �� *SubmitCommand+5t      5u      5w      5y      5{      5|      