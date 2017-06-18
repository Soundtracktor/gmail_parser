# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GmailParseJob, type: :job do
  include ActiveJob::TestHelper

  let(:search) { create(:search) }

  subject(:job) do
    described_class.perform_later(
      search_id: search.id
    )
  end

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in parser queue' do
    expect(described_class.new.queue_name).to eq('parser')
  end

  it 'executes perform' do
    gmail_mock = instance_double(Parsers::Gmail)

    allow(Parsers::Gmail).to receive(:new)
      .and_return(gmail_mock)

    allow(gmail_mock).to receive(:parse)
      .and_return(true)

    perform_enqueued_jobs { job }

    expect(Parsers::Gmail).to have_received(:new)
      .with(search_id: search.id)

    expect(gmail_mock).to have_received(:parse)
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
