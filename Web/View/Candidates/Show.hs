module Web.View.Candidates.Show where
import Web.View.Prelude

data ShowView = ShowView { candidate :: Candidate }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CandidatesAction}>Candidates</a></li>
                <li class="breadcrumb-item active">Show Candidate</li>
            </ol>
        </nav>
        <h1>Show Candidate</h1>
         <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Name</h6>
                <small class="text-muted">{(get #name candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Education</h6>
                <small class="text-muted">{(get #education candidate)}</small>
              </div>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Email</h6>
                <small class="text-muted">{(get #email candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Tech skill</h6>
                <small class="text-muted">{(get #skills candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Status</h6>
                <small class="text-muted">{(get #status candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Linkedin</h6>
                <small class="text-muted">{(get #linkedin candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Github</h6>
                <small class="text-muted">{(get #github candidate)}</small>
              </div>
            </li>
        </ul>
    |]
