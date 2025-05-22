@extends('admin.layout.home')
@section('content')
    <div class="container-fluid">
        @if (session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger">{{ session('error') }}</div>
        @endif
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="row">
            <!-- Sidebar for folder navigation -->
            <div class="col-md-2">
                <div class="card">
                    <div class="card-header">Folders</div>
                    <div class="list-group">
                        @foreach ($folders as $folder)
                            <a href="{{ route('image_gallary.index', ['folder' => $folder]) }}"
                                class="list-group-item {{ request('folder') == $folder ? 'active' : '' }}">
                                <i class="fas {{ request('folder') == $folder ? 'fa-folder-open' : 'fa-folder' }}"></i>
                                {{ $folder }}
                            </a>
                            {{-- <a href="#" class="list-group-item folder-link" data-folder="{{ $folder }}"><i
                                    class="fas fa-folder"></i> {{ $folder }}</a> --}}
                        @endforeach
                        <a href="#" class="list-group-item" data-toggle="modal" data-target="#createFolderModal">
                            <i class="fas fa-plus"></i> Create Folder
                        </a>
                    </div>
                </div>
            </div>

            <!-- Main content area -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5>Images in Folder Name</h5>
                        <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#uploadImageModal">
                            <i class="fas fa-upload"></i> Upload Image
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @if ($selectedFolder)
                                @forelse ($images as $image)
                                    <div class="col-md-2 mb-3">
                                        <div class="card">
                                            <div class="card-body">
                                                <a
                                                    href="{{ route('image.info', ['folder' => $selectedFolder, 'file' => $image]) }}">
                                                    <img src="{{ asset('upload/' . $selectedFolder . '/' . $image) }}"
                                                        class="card-img-top" alt="{{ $image }}">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                @empty
                                    <p>No images found in this folder.</p>
                                @endforelse
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card" id="image-info">
                    <div class="card-header">Image Info</div>
                    <div class="card-body">
                        @if (session('image_info'))
                            @php $info = session('image_info'); @endphp

                            <p><strong>File Name:</strong> {{ $info['file'] }}</p>
                            <p><strong>Upload Date:</strong> {{ $info['upload_date'] }}</p>
                            <p><strong>Size:</strong> {{ $info['size'] }} KB</p>

                            <!-- Update Alt Text -->
                            <form action="{{ route('image.updateAlt') }}" method="POST">
                                @csrf
                                <input type="hidden" name="folder" value="{{ $info['folder'] }}">
                                <input type="hidden" name="file" value="{{ $info['file'] }}">

                                <div class="mb-3">
                                    <label class="form-label">Alt Text</label>
                                    <input type="text" class="form-control" name="alt"
                                        value="{{ $info['alt'] ?? '' }}">
                                </div>
                                <button class="btn btn-sm btn-primary" type="submit">Update Alt Text</button>
                            </form>

                            <!-- Delete Image -->
                            <form action="{{ route('image.delete') }}" method="POST" class="mt-2">
                                @csrf
                                @method('DELETE')
                                <input type="hidden" name="folder" value="{{ $info['folder'] }}">
                                <input type="hidden" name="file" value="{{ $info['file'] }}">
                                <button class="btn btn-sm btn-danger" type="submit"
                                    onclick="return confirm('Delete this image?')">Delete Image</button>
                            </form>
                        @else
                            <p>Select an image to view details.</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- Create Folder Modal -->
    <div class="modal fade" id="createFolderModal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <form action="{{ route('create-folder') }}" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Create New Folder</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Folder Name</label>
                            <input type="text" class="form-control" placeholder="Enter folder name" name="folder_name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Create</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Upload Image Modal -->
    <div class="modal fade" id="uploadImageModal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <form enctype="multipart/form-data" action="{{ route('upload-image') }}" method="POST">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Upload Image</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Choose Image</label>
                            <input type="file" class="dropify" name="image_upload[]" multiple />
                        </div>
                        <!-- Hidden input: populated via JS when a folder is selected -->
                        <input type="hidden" name="folder" id="selected_folder_input"
                            value="{{ request('folder') }}">
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Upload</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script src="{{ asset_admin_plugin('dropify/dropify.min.js') }}"></script>
    <script>
        let selectedFolder = null;

        $(document).ready(function() {
            // Highlight selected folder and change icon
            $('.folder-link').click(function(e) {
                e.preventDefault();

                // Reset all folder icons
                $('.folder-link i').removeClass('fa-folder-open').addClass('fa-folder');
                $('.folder-link').removeClass('active');

                // Highlight selected
                $(this).addClass('active');
                $(this).find('i').removeClass('fa-folder').addClass('fa-folder-open');

                // // Save selected folder
                // selectedFolder = $(this).data('folder');

                // // Update hidden input in the upload form (if any)
                // $('#selected_folder_input').val(selectedFolder);
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            // When a folder is clicked
            $('.folder-link').on('click', function() {
                var folderName = $(this).data('folder'); // Get the folder name from data-folder attribute
                $('#selected_folder_input').val(folderName); // Set the hidden input value
                console.log(folderName);
            });
        });
    </script>
    <script>
        $('#uploadImageModal').on('shown.bs.modal', function() {
            // Destroy any previous Dropify instances to avoid duplication
            $('.dropify').dropify().destroy();

            // Re-initialize Dropify inside modal
            $('.dropify').dropify();
        });
    </script>
@endsection

@section('styles')
    <link href="{{ asset_admin_plugin('dropify/dropify.min.css') }}" rel="stylesheet" type="text/css" />
@endsection
