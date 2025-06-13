class CortexappsCli < Formula
  include Language::Python::Virtualenv
  desc     "Command-line Interface for Cortexapps"
  homepage "https://github.com/cortexapps/cli"
  url "https://pypi.io/packages/source/c/cortexapps_cli/cortexapps_cli-1.0.0.tar.gz"
  sha256  "68ba41bb88e70a393f44895f766ead2d80eb1aaf8578ab68fdb534f5a6a4d8e8"
  license "MIT"

  depends_on "python@3.11"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/71/da/e94e26401b62acd6d91df2b52954aceb7f561743aa5ccc32152886c76c96/certifi-2024.2.2.tar.gz"
    sha256 "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2/idna-3.6.tar.gz"
    sha256 "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0/PyYAML-6.0.1.tar.gz"
    sha256 "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/e2/cc/abf6746cc90bc52df4ba730f301b89b3b844d6dc133cb89a01cfe2511eb9/urllib3-2.2.0.tar.gz"
    sha256 "051d961ad0c62a94e50ecf1af379c3aba230c66c710493493560c0c223c49f20"
  end

  def install
     # Fix for this error encountered during install
     # ValueError: ZIP does not support timestamps before 1980
     system "find", ".", "-type", "f", "-exec", "touch", "{}", "+"
  
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      To make the CLI available in your SYSTEM path, run this command to add the path to your shell's profile.

      Not sure what shell you are using?  Run this command:
      echo $SHELL

      Bash:
      export PATH="#{bin}:$PATH" >> ~/.bash_profile

      zsh:
      export PATH="#{bin}:$PATH" >> ~/.zprofile

      Restart your terminal for the settings to take effect.

      Run 'cortex -v' to verify.
    EOS
  end

  test do
    assert_match "Cortex CLI #{version}", shell_output("#{bin}/cortex -v")
  end
end
