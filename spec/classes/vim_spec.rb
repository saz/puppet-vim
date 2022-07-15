# frozen_string_literal: true

require 'spec_helper'

describe 'vim', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:params) { {} }
      let(:facts) { facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to create_class('vim') }
      it { is_expected.to contain_class('vim::params') }

      puts "Testing #{os} (#{facts[:os]['family']})"

      case facts[:os]['family']
      when 'Debian'

        context 'when using default class parameters' do
          it { is_expected.to contain_file('/etc/vim/vimrc').with_ensure('file') }
          it { is_expected.to contain_exec('update-alternatives --set editor /usr/bin/vim.nox').with_command('update-alternatives --set editor /usr/bin/vim.nox') }
        end

        context 'when custom package = vim-tiny' do
          let(:params) { { package: 'vim-tiny' } }

          it { is_expected.to contain_package('vim-tiny').with_ensure('present') }
        end

        context 'when autoupgrade => true' do
          let(:params) { { autoupgrade: true } }

          it { is_expected.to contain_package('vim-nox').with_ensure('latest') }
        end

        context 'when ensure => absent' do
          let(:params) { { ensure: 'absent' } }

          it { is_expected.to contain_package('vim-nox').with_ensure('absent') }
          it { is_expected.to contain_file('/etc/vim/vimrc').with_ensure('absent') }
        end

      when 'RedHat'

        context 'when using default class parameters' do
          it { is_expected.to contain_file('/etc/vimrc').with_ensure('file') }
        end

        context 'when autoupgrade => true' do
          let(:params) { { autoupgrade: true } }

          it { is_expected.to contain_package('vim-enhanced').with_ensure('latest') }
        end

        context 'when ensure => absent' do
          let(:params) { { ensure: 'absent' } }

          it { is_expected.to contain_package('vim-enhanced').with_ensure('absent') }
          it { is_expected.to contain_file('/etc/vimrc').with_ensure('absent') }
        end

      when 'Archlinux'

        context 'when using default class parameters' do
          it { is_expected.to contain_file('/etc/vimrc').with_ensure('file') }
        end

        context 'when autoupgrade => true' do
          let(:params) { { autoupgrade: true } }

          it { is_expected.to contain_package('vim').with_ensure('latest') }
        end

        context 'when ensure => absent' do
          let(:params) { { ensure: 'absent' } }

          it { is_expected.to contain_package('vim').with_ensure('absent') }
          it { is_expected.to contain_file('/etc/vimrc').with_ensure('absent') }
        end

      when 'Gentoo'

        context 'when using default class parameters' do
          it { is_expected.to contain_file('/etc/vimrc').with_ensure('file') }
          it { is_expected.to contain_exec('eselect editor set /usr/bin/vim').with_command('eselect editor set /usr/bin/vim') }
        end

        context 'when autoupgrade => true' do
          let(:params) { { autoupgrade: true } }

          it { is_expected.to contain_package('app-editors/vim').with_ensure('latest') }
        end

        context 'when ensure => absent' do
          let(:params) { { ensure: 'absent' } }

          it { is_expected.to contain_package('app-editors/vim').with_ensure('absent') }
          it { is_expected.to contain_file('/etc/vimrc').with_ensure('absent') }
        end

      else
        pending "There are no tests for #{os} (#{facts[:os]['family']})"
      end
    end
  end
end
