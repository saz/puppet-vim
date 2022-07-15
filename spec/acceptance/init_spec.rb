# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'vim' do
  package_name = case fact('os.family')
                 when 'Debian'
                   'vim-nox'
                 when 'RedHat'
                   'vim-enhanced'
                 else
                   'vim'
                 end

  context 'with all defaults' do
    let(:pp) do
      'include vim'
    end

    it 'works idempotently with no errors' do
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package(package_name) do
      it { is_expected.to be_installed }
    end
  end
end
