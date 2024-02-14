part of 'ds_button.dart';

abstract class DSButtonType {
  DSElevatedButton filled(
    String textButton, {
    Function()? onPressed,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool expanded,
    bool isLoading,
    bool separetedIcon,
  });

  DSElevatedButton tonal(
    String textButton, {
    Function()? onPressed,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool expanded,
    bool isLoading,
    bool separetedIcon,
  });

  DSElevatedButton outlined(
    String textButton, {
    Function()? onPressed,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool expanded,
    bool isLoading,
    bool separetedIcon,
  });

  DSElevatedButton ghost(
    String textButton, {
    Function()? onPressed,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool isLoading,
    bool separetedIcon,
  });

  DSElevatedButton iconFilled({
    required IconData icon,
    Function()? onPressed,
    bool isLoading,
  });

  DSElevatedButton iconTonal({
    required IconData icon,
    Function()? onPressed,
    bool isLoading,
  });

  DSElevatedButton iconOutlined({
    required IconData icon,
    Function()? onPressed,
    bool isLoading,
  });

  DSElevatedButton iconGhost({
    required IconData icon,
    Function()? onPressed,
    bool isLoading,
  });
}
